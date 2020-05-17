import { Injectable } from '@angular/core';
import {AngularFirestore} from "@angular/fire/firestore";
import {AngularFireAuth} from "@angular/fire/auth";
import {User} from "firebase";

@Injectable({
  providedIn: 'root'
})
export class StudentDetailsService {

  constructor(private _af: AngularFirestore,
              private _auth: AngularFireAuth) { }


}
