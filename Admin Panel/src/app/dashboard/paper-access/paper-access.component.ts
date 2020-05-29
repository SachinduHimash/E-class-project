import {Component, OnInit} from '@angular/core';
import {AngularFirestore} from '@angular/fire/firestore';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import 'firebase/firestore';
import {MatVerticalStepper} from '@angular/material/stepper';
import {NotificationService} from '../services/notification.service';
import * as moment from 'moment';
import * as firebase from 'firebase';

@Component({
  selector: 'app-paper-access',
  templateUrl: './paper-access.component.html',
  styleUrls: ['./paper-access.component.css']
})
export class PaperAccessComponent implements OnInit {


  constructor() {
  }

  ngOnInit(): void {
  }


}
