import {Component, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, FormGroupDirective, NgForm, Validators} from '@angular/forms';
import {AngularFirestore} from '@angular/fire/firestore';
import {AuthenticationService} from '../../services/authentication.service';
import {NotificationService} from '../../services/notification.service';

import {Class} from '../../interfaces/databaseInterfaces';
import * as firebase from "firebase";
import {ErrorStateMatcher} from "@angular/material/core";

@Component({
  selector: 'app-update-student',
  templateUrl: './update-student.component.html',
  styleUrls: ['./update-student.component.css']
})
export class UpdateStudentComponent implements OnInit, OnChanges {

  @Input() student;
  matcher = new MyErrorStateMatcher();
// forms
  uid;
  passwordError = false;
  createClass: FormGroup;
  createStudent: FormGroup;
  // class_type
  classTypes: any[] = [];

  passwordType = 'password';
  updatePassword: FormGroup;
  updateClass: FormGroup;
  progress = false;

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              private _authService: AuthenticationService,
              private _notification: NotificationService) {
  }

  ngOnInit(): void {

    this.fetchClasses();
    this.buildCreateStudent();
    this.buildUpdatePassword();
    this.buildUpdateClass();
  }

  async ngOnChanges(changes: SimpleChanges) {
    if (this.student) {
      this.uid = this.student.uid;
      if (!this.createStudent) {
        await this.buildCreateStudent();
      }

      const object = {
        fullName: this.student.fullName,
        address: this.student.address,
        teleNo: this.student.teleNo,
        school: this.student.school,
      };


      this.createStudent.patchValue(object);

    }
  }

  showPassword() {
    this.passwordType === 'text' ? this.passwordType = 'password' : this.passwordType = 'text';
  }

  submitUpdatePassword() {
    const formValue = this.updatePassword.value;
    formValue.password = this._authService.hashString(formValue.password);
    this._af.firestore.doc(`users/${this.uid}`)
      .update({
        Teeeepassword: formValue.password
      }).then(r => this._notification.NotificationMessage('Updated Password'))
      .catch(e => this._notification.ErrorMessage('Failed to update Password'));
  }

  watchPassword() {
    // tslint:disable-next-line:max-line-length
    this.updatePassword.value.password !== this.updatePassword.value.confirmPassword ? this.passwordError = true : this.passwordError = false;
  }

  buildCreateStudent() {
    this.createStudent = this._fb.group({
        fullName: new FormControl('', Validators.required),
        address: new FormControl('', Validators.required),
        teleNo: new FormControl('', Validators.required),
        // email: new FormControl('', Validators.email),
        school: new FormControl('', Validators.required),
      }
    );
  }

  buildUpdatePassword() {
    this.updatePassword = this._fb.group({
        password: new FormControl('Student@123', Validators.required),
        confirmPassword: new FormControl('Student@123', Validators.required),
      },
    );
  }

  buildUpdateClass() {
    this.updateClass = this._fb.group({
        class: new FormControl('', Validators.required),
      },
    );
  }

  checkPasswords(group: FormGroup) { // here we have the 'passwords' group
    const pass = group.get('password').value;
    const confirmPass = group.get('confirmPassword').value;

    return pass === confirmPass ? null : {notSame: true};
  }


  async submit() {
    try {
      const formValue = this.createStudent.value;
      console.log(formValue);
      // // hash_password_with_md5
      // formValue.password = this._authService.hashString(formValue.password);

      await this._af.firestore.doc(`users/${this.uid}`)
        .update(formValue);

      await this._af.firestore.doc(`class/${this.student.grade}/students/${this.uid}`)
        .update(formValue);
      this._notification.NotificationMessage('User details update successfully');
    } catch (e) {
      this._notification.NotificationMessage('User details update failed');
    }

  }

  fetchClasses() {
    this._af.collection('class')
      .valueChanges({idField: 'id'})
      .subscribe(docs => {
        this.classTypes = this.classTypes.concat(docs.map((data: Class) => {
          return {
            name: data.grade.toString().concat(' - ').concat(data.name.toString()),
            value: data.id, grade: data.grade
          };
        }));
      });
  }

  async updateClassSubmit() {

    try {

      this.progress = true;

      const formValue = this.updateClass.value;
      const classId = formValue.class.value;

      const userExistence = await this._af.firestore.doc(`class/${classId}/students/${this.uid}`)
        .get();

      if (userExistence.exists) {
        this._notification.ErrorMessage('User already exists on class');
        this.progress = false;
        return;
      }

      await this._af.firestore.doc(`users/${this.uid}`)
        .update({class: classId});

      const userData = await this._af.firestore.doc(`class/${this.student.grade}/students/${this.uid}`)
        .get();

      const marksData = await this._af.firestore.collection(`class/${this.student.grade}/students/${this.uid}/marks`)
        .get();

      await this._af.firestore.doc(`class/${classId}/students/${this.uid}`)
        .set({
          ...userData.data(),
          changeClassAt: firebase.firestore.FieldValue.serverTimestamp()
        });

      const marksDataUpdateReferences = marksData.docs.map(r => {
        return {
          ref: this._af.firestore.collection(`class/${classId}/students/${this.uid}/marks`).doc(r.id),
          data: r.data()
        };
      });

      while (marksDataUpdateReferences.length) {
        const referencesBatch2 = marksDataUpdateReferences.splice(0, 500);
        const batch = this._af.firestore.batch();
        for (const reference of referencesBatch2) {
          batch.set(reference.ref, reference.data);
        }
        await batch.commit();
      }

      const marksDataReferences = marksData.docs.map(r => r.ref);

      while (marksDataReferences.length) {
        const referencesBatch = marksDataReferences.splice(0, 500);
        const batch = this._af.firestore.batch();
        for (const reference of referencesBatch) {
          batch.delete(reference);
        }
        await batch.commit();
      }

      await this._af.firestore.doc(`class/${this.student.grade}/students/${this.uid}`)
        .delete();

      this.progress = false;
      this._notification.NotificationMessage('Update student successfully');
    } catch (e) {
      this.progress = false;
      this._notification.NotificationMessage('Update student fail');
    }

  }
}
export class MyErrorStateMatcher implements ErrorStateMatcher {
  isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
    const invalidCtrl = !!(control && control.invalid && control.parent.dirty);
    const invalidParent = !!(control && control.parent && control.parent.invalid && control.parent.dirty);
    return (invalidCtrl || invalidParent);
  }
}
