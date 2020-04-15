import {Component, OnInit} from '@angular/core';
import {AngularFirestore} from '@angular/fire/firestore';
import {Observable} from 'rxjs';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {AngularFireAuth} from '@angular/fire/auth';

import {CustomValidator} from '../../custom-validator';

// import_for_adding_timestamp
import * as firebase from 'firebase';

@Component({
  selector: 'app-admins',
  templateUrl: './admins.component.html',
  styleUrls: ['./admins.component.css']
})
export class AdminsComponent implements OnInit {

  // list_of_admin_users
  adminList: Observable<any[]>;
  // password_input_field_type
  passwordType = 'password';
  conFirmPasswordType = 'password';
  // form
  form: FormGroup;

  constructor(private _af: AngularFirestore,
              private _fb: FormBuilder,
              private _auth: AngularFireAuth) {
  }


  ngOnInit(): void {
    this.fetchAdmins();
    this.buildForm();
  }

  fetchAdmins() {
    this.adminList = this._af.collection('users', ref => ref.where('role', '==', 'admin')).valueChanges();
    // tc
    // this.adminList.subscribe(console.log);
  }

  // build_form
  buildForm() {
    this.form = this._fb.group({
        userName: new FormControl('', Validators.required),
        email: new FormControl('', [Validators.required, Validators.email]),
        password: new FormControl('', Validators.required),
        confirmPassword: new FormControl('', Validators.required),
      },
      // custom_validate_for_match_password_and_confirm_password_class_locate_on_'app/custom-validators.ts'{fn}
      {
        validators: CustomValidator.passwordMatchValidator
      }
    );
  }// eo_buildForm

  // change_password_input_field_type
  showPassword() {
    this.passwordType === 'text' ? this.passwordType = 'password' : this.passwordType = 'text';
  }

  showConfirmPassword() {
    this.conFirmPasswordType === 'text' ? this.conFirmPasswordType = 'password' : this.conFirmPasswordType = 'text';
  }

  // submit_form_value
  submit() {
    if (this.form.valid) {

      // tc
      // console.log(this.form.value);

      // get_form_value
      const formValue = this.form.value;

      // document_for_add_to_user_collection
      const docData = {
        name: formValue.userName,
        role: 'admin',
        uid: '',
        createdAt: firebase.firestore.FieldValue.serverTimestamp()
      };

      // tc
      // console.log(docData);

      // first_register_admin_user_with_firebase_authentication_and_then_add_to_users_collection
      this._auth.createUserWithEmailAndPassword(formValue.email, formValue.password)
        .then(credential => {
          docData.uid = credential.user.uid;
          this._af
            .collection('users')
            .doc(credential.user.uid)
            .set(docData)
            .then(doc => console.log(doc))
            .catch(err => console.log(err));
        })
        .catch(err => console.log(err.message));

    } // eo_if
  }// eo_submit




}
