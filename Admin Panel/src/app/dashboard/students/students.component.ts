import {Component, OnInit} from '@angular/core';
import {AngularFirestore} from '@angular/fire/firestore';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';

// type_definition
import {Users, Class} from '../interfaces/databaseInterfaces';

// authentication_service_for_hashing password
import {AuthenticationService} from '../services/authentication.service';

import * as firebase from 'firebase';
import 'firebase/firestore';
import {NotificationService} from '../services/notification.service';

@Component({
  selector: 'app-students',
  templateUrl: './students.component.html',
  styleUrls: ['./students.component.css']
})
export class StudentsComponent implements OnInit {

  // forms
  createClass: FormGroup;
  createStudent: FormGroup;
  // class_type
  classTypes: any[] = [];



  // show_hide_add_class
  addStudentShow = false;
  buttonText = 'Insert student';


  passwordType = 'password';

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
        address: new FormControl('',),
        teleNo: new FormControl('',),
        email: new FormControl('', Validators.email),
        school: new FormControl('',),
        class: new FormControl('',),
        password: new FormControl('', Validators.required),
      },
    );
  }

  submit() {

    const formValue = this.createStudent.value;
    // hash_password_with_md5
    formValue.password = this._authService.hashString(formValue.password);

    const userObj = {
      ...formValue,
      createdAt: firebase.firestore.FieldValue.serverTimestamp(),
      role: 'student'
    };

    // remove_user_id_&_class_field
    delete userObj.userId;
    // remove_nested_class_object_&_only_add_class_code
    userObj.class = userObj.class.value;

    // first_check_user_is_already_exists
    this._af.firestore
      .doc(`users/${formValue.userId}`)
      .get()
      .then((documentSnapshot) => {

        // if_document_already_exists_return
        // else_if_class_information_is_provided_then_update_users_and_class_collections
        // otherwise_only_update_users_collection

        if (documentSnapshot.exists) {
          console.log('user already exists');
        } else if (!documentSnapshot.exists && (!formValue.class.value || formValue.class === '')) {
          this._af.doc(`users/${formValue.userId}`)
            .set(userObj)
            .catch(() => this._notification.ErrorMessage('failed to add user'));
        } else if (!documentSnapshot.exists && formValue.class.value) {
          this._af.doc(`users/${formValue.userId}`)
            .set(userObj)
            .then(() => {
              this._af.doc(`class/${formValue.class.value}/students/${formValue.userId}`)
                .set({
                  fullName: formValue.fullName,
                  year: Number(new Date().getFullYear()) + 11 - formValue.grade,
                })
                .then(() => this._notification.NotificationMessage('successfully added user'))
                .catch(() => this._notification.ErrorMessage('failed to add user to class'));
            })
            .catch(() => this._notification.ErrorMessage('failed to add user'));

        }
      });


  }

  fetchClasses() {
    this._af.collection('class')
      .valueChanges({idField: 'id'})
      .subscribe(docs => {

        this.classTypes.push({name: 'Don\'t assign to class', value: null, grade: null});

        this.classTypes = this.classTypes.concat(docs.map((data) => {
          // @ts-ignore
          return {name: data.grade.toString().concat(' - ').concat(data.name.toString()), value: data.id, grade: data.grade};
        }));


      });
  }

  // change_password_input_field_type
  showPassword() {
    this.passwordType === 'text' ? this.passwordType = 'password' : this.passwordType = 'text';
  }

  // show_hide_add_class_content
  showAddStudent() {
    this.addStudentShow ? this.buttonText = 'Insert student' : this.buttonText = 'Hide form';
    this.addStudentShow = !this.addStudentShow;

  }
}
