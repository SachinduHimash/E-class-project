import { Injectable } from '@angular/core';
import {Md5} from 'ts-md5';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  constructor() { }

  hashString = (value) => Md5.hashStr(value);

  showPassword(passwordType) {
    passwordType === 'text' ? passwordType = 'password' : passwordType = 'text';
    return passwordType;
  }
}
