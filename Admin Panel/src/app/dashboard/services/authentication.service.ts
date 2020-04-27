import { Injectable } from '@angular/core';
import {Md5} from 'ts-md5';
import {first} from 'rxjs/operators';
import {AngularFireAuth} from '@angular/fire/auth';
import {NotificationService} from './notification.service';
import {AngularFirestore} from '@angular/fire/firestore';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
  private uid;
  private user: any;
  private userData: any;

  constructor(private _auth: AngularFireAuth,
              private _notification: NotificationService,
              private _af: AngularFirestore) { }

  hashString = (value) => Md5.hashStr(value);

  showPassword(passwordType) {
    passwordType === 'text' ? passwordType = 'password' : passwordType = 'text';
    return passwordType;
  }


  isLoggedIn = () => this._auth.authState.pipe(first()).toPromise();

  // fetch_login_user_detail_from_'users'_collection
  async getUserData() {

    this.user = await this.isLoggedIn();

    if (this.user) {
      // tc
      // console.log(this.user);
      this.uid = this.user?.uid;

      await this._af.collection('users')
        // @ts-ignore
        .doc(this.user?.uid)
        .valueChanges()
        .subscribe((doc) => {
          this.userData = doc;
          // @ts-ignore
        });
    } else {
      this._notification.ErrorMessage('please reauthenticate');
    }

    return this.userData;
  }

}
