import {Component, OnInit} from '@angular/core';
import {AngularFirestore} from '@angular/fire/firestore';
import {AngularFireAuth} from '@angular/fire/auth';
import {first} from 'rxjs/operators';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import * as firebase from 'firebase';

@Component({
  selector: 'app-userprofile',
  templateUrl: './userprofile.component.html',
  styleUrls: ['./userprofile.component.css']
})
export class UserprofileComponent implements OnInit {
  // user_data_from_firebase_authentication_credential
  user;
  // from_users_collection
  userData;
// user_id_of_current_user
  uid: String;

  // forms
  userProfile: FormGroup;
  updatePassword: FormGroup;
  updateEmail: FormGroup;

  // type_of_password_input_field
  passwordType = 'password';
  // if_password_and_confirm_password_mismatch
  passwordError = false;

  constructor(private _af: AngularFirestore,
              private _auth: AngularFireAuth,
              private _fb: FormBuilder) {
  }

  ngOnInit(): void {
    this.getUserData();
    this.buildUpdateUserProfile();
    this.buildUpdateEmail();
    this.buildUpdatePassword();
  }

  // check_user_login_state
  isLoggedIn = () => this._auth.authState.pipe(first()).toPromise();

  // fetch_login_user_detail_from_'users'_collection
  async getUserData() {

    this.user = await this.isLoggedIn();

    if (this.user) {
      // tc
      // console.log(this.user);
      this.uid = this.user?.uid;

      this._af.collection('users')
        // @ts-ignore
        .doc(this.user?.uid)
        .valueChanges()
        .subscribe((doc) => {
          this.userData = doc;
          // @ts-ignore
          this.userProfile.controls['userName'].patchValue(doc.name);
        });
    } else {
      console.log('not login');
    }
  } // eo getUserData

  // form_builders
  buildUpdateUserProfile() {
    this.userProfile = this._fb.group({
        userName: new FormControl('', Validators.required),
      },
    );
  }

  buildUpdateEmail() {
    this.passwordType = 'password';
    this.updateEmail = this._fb.group({
        email: new FormControl('', [Validators.required, Validators.email]),
        password: new FormControl('', Validators.required),
      },
    );
  }

  buildUpdatePassword() {
    this.updatePassword = this._fb.group({
        oldPassword: new FormControl('', Validators.required),
        password: new FormControl('', Validators.required),
        confirmPassword: new FormControl('', Validators.required),
      },
    );
  }

  // eo_form_builders

  // form_submit
  submit() {
    this._af.collection('users')
      // @ts-ignore
      .doc(this.uid)
      .update({
        name: this.userProfile.value.userName,
      })
      .then((doc) => console.log(doc))
      .catch(err => console.log(err));
  }

  // create_credential_for_reauthentication
  updateUser = (password) => {
    const userLogged = firebase.auth().currentUser;
    const credential = firebase.auth.EmailAuthProvider.credential(
      this.user.email,
      password
    );
    return {userLogged, credential};
  };

  submitUpdatePassword() {

    const formValue = this.updatePassword.value;
    const cred = this.updateUser(formValue.oldPassword);

    cred.userLogged.reauthenticateWithCredential(cred.credential)
      .then(() => {
        console.log('here1');
        cred.userLogged.updatePassword(formValue.password)
          .then(() => console.log('update password'))
          .catch(() => console.log('failed to update password'));
        console.log('here2');
      })
      .catch(() => 'old password is incorrect');
  }

  submitUpdateEmail() {
    console.log(this.updateEmail.value);
    const formValue = this.updateEmail.value;
    const cred = this.updateUser(formValue.password);

    cred.userLogged.reauthenticateWithCredential(cred.credential)
      .then(() => {
        cred.userLogged.updateEmail(formValue.email)
          .then(() => console.log('update email'))
          .catch(() => console.log('update fail'));
      })
      .catch(() => 'old password is incorrect');

  }

  // eo_form_submit

  showPassword() {
    this.passwordType === 'text' ? this.passwordType = 'password' : this.passwordType = 'text';
  }

  watchPassword() {
    // tslint:disable-next-line:max-line-length
    this.updatePassword.value.password !== this.updatePassword.value.confirmPassword ? this.passwordError = true : this.passwordError = false;
  }
}
