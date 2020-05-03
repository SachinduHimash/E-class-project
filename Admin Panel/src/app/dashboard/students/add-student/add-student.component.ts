import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, FormGroupDirective, NgForm, Validators} from '@angular/forms';
import {AngularFirestore} from '@angular/fire/firestore';
import {AuthenticationService} from '../../services/authentication.service';
import {NotificationService} from '../../services/notification.service';
import {ErrorStateMatcher} from '@angular/material/core';
import * as firebase from 'firebase';

import {Class} from '../../interfaces/databaseInterfaces';

@Component({
  selector: 'app-add-student',
  templateUrl: './add-student.component.html',
  styleUrls: ['./add-student.component.css']
})
export class AddStudentComponent implements OnInit {

  // forms
  createClass: FormGroup;
  createStudent: FormGroup;
  // class_type
  classTypes: any[] = [];

  passwordType = 'password';
  matcher = new MyErrorStateMatcher();

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              private _authService: AuthenticationService,
              private _notification: NotificationService) {
  }

  ngOnInit(): void {

    this.fetchClasses();
    this.buildCreateStudent();
  }

  buildCreateStudent() {
    this.createStudent = this._fb.group({
        userId: new FormControl('', Validators.required),
        fullName: new FormControl('', Validators.required),
        address: new FormControl('', Validators.required),
        teleNo: new FormControl('', Validators.required),
        // email: new FormControl('', Validators.email),
        school: new FormControl('', Validators.required),
        class: new FormControl('', Validators.required),
        password: new FormControl('Student@123', Validators.required),
        confirmPassword: new FormControl('Student@123', Validators.required),
      }, {
        validator: this.checkPasswords
      }
    );
  }

  checkPasswords(group: FormGroup) { // here we have the 'passwords' group
    const pass = group.get('password').value;
    const confirmPass = group.get('confirmPassword').value;

    return pass === confirmPass ? null : {notSame: true};
  }


  submit() {

    const formValue = this.createStudent.value;
    // hash_password_with_md5
    formValue.password = this._authService.hashString(formValue.password);

    this._af.firestore
      .doc(`users/${formValue.userId}`)
      .get()
      .then((documentSnapshot) => {
        if (documentSnapshot.exists) {
          this._notification.ErrorMessage('user already exists');
        } else {
          this._af.doc(`users/${formValue.userId}`)
            .set({
              role: 'student',
              password: formValue.password,
              fullName: formValue.fullName,
              class: formValue.class,
              createdAt: firebase.firestore.FieldValue.serverTimestamp()
            }).then(() => {
            this._af.doc(`class/${formValue.class.value}/students/${formValue.userId}`)
              .set({
                fullName: formValue.fullName,
                year: Number(new Date().getFullYear()) + 11 - formValue.grade,
                address: formValue.address,
                teleNo: formValue.teleNo,
                userId: formValue.userId,
                school: formValue.school,
                class: formValue.class,
              })
              .then(() => this._notification.NotificationMessage('successfully added user'))
              .catch(() => this._notification.ErrorMessage('failed to add user to class'));
          }).catch(() => this._notification.ErrorMessage('Failed add new student'));
        }
      }).catch(() => this._notification.ErrorMessage('Failed add new student'));
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
}


export class MyErrorStateMatcher implements ErrorStateMatcher {
  isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
    const invalidCtrl = !!(control && control.invalid && control.parent.dirty);
    const invalidParent = !!(control && control.parent && control.parent.invalid && control.parent.dirty);
    return (invalidCtrl || invalidParent);
  }
}
