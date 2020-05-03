import {Component, OnInit} from '@angular/core';
import {Observable, Subject} from 'rxjs';
import {AngularFirestore} from '@angular/fire/firestore';
import {AngularFireAuth} from '@angular/fire/auth';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';

// use_for_timestamp
import * as firebase from 'firebase';
import 'firebase/firestore';

// notifications
import {NotificationService} from '../services/notification.service';

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
  // password_not_match
  passwordError = false;

  private destroy = new Subject();

  constructor(private _af: AngularFirestore,
              private _auth: AngularFireAuth,
              private _fb: FormBuilder,
              private _notification: NotificationService) {
  }

  ngOnInit(): void {
    this.fetchAdmins();
    this.buildForm();
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
      // {
      //   // validators: CustomValidator.passwordMatchValidator
      // }
    );
  }// eo_buildForm

  fetchAdmins() {
    this.adminList = this._af.collection('users', ref => ref.where('role', '==', 'admin'))
      .valueChanges();
  }

  // change_password_input_field_type
  showPassword() {
    this.passwordType === 'text' ? this.passwordType = 'password' : this.passwordType = 'text';
  }

  showConfirmPassword() {
    this.conFirmPasswordType === 'text' ? this.conFirmPasswordType = 'password' : this.conFirmPasswordType = 'text';
  }

  submit() {

    if (this.form.value.password !== this.form.value.confirmPassword) {

    }
    if (this.form.valid) {

      // tc
      // console.log(this.form.value);

      // get_form_value
      const formValue = this.form.value;

      const docData = {
        name: formValue.userName,
        role: 'admin',
        uid: '',
        createdAt: firebase.firestore.FieldValue.serverTimestamp()
      };

      this._auth.createUserWithEmailAndPassword(formValue.email, formValue.password)
        .then(credential => {
          docData.uid = credential.user.uid;
          this._af
            .collection('users')
            .doc(credential.user.uid)
            .set(docData)
            .then(doc => {
              this._notification.NotificationMessage('successfully added user');
            })
            .catch(err => this._notification.ErrorMessage(err));
        })
        .catch(err => this._notification.ErrorMessage(err));

    } // eo_if
  }// eo_submit

  watchPassword() {
    this.form.value.password !== this.form.value.confirmPassword ? this.passwordError = true : this.passwordError = false;
  }
}
