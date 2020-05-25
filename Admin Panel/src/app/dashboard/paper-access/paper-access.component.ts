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
  paperAccess: FormGroup;
  endMessage: string;
  showPaperAccess = false;
  secondFormGroup: FormGroup;
  firstFormGroup: FormGroup;
  thirdFormGroup: FormGroup;
  fourthFormGroup: FormGroup;
  linear = true;
  editable = false;
  grade: Number;
  class: string;
  classes: any;
  papers: any;
  progress: boolean;
  progress2: boolean;
  day: any;

  constructor(private _af: AngularFirestore,
              private _fb: FormBuilder,
              public  _message: NotificationService) {
  }

  ngOnInit(): void {
    this.buildPaperAccess();
  }

  buildPaperAccess() {
    this.firstFormGroup = this._fb.group({
      grade: ['', Validators.required]
    });
    this.secondFormGroup = this._fb.group({
      class: ['', Validators.required]
    });
    this.thirdFormGroup = this._fb.group({
      time: ['', Validators.required]
    });
    this.fourthFormGroup = this._fb.group({
      paperNumber: ['', Validators.required]
    });
  }

  setPaperAccess() {
    console.log(this.firstFormGroup.value);
  }

  getClassByGrade(stepper: MatVerticalStepper) {
    // console.log(this.firstFormGroup.value);
    const grade = Number(this.firstFormGroup.value.grade);
    // console.log(grade);
    this.progress = true;
    this._af.collection('class', ref => ref.where('grade', '==', grade))
      .valueChanges({idField: 'id'})
      .subscribe(docs => {
        // console.log(docs);
        if (docs.length === 0) {
          this._message.ErrorMessage('No papers data Found');
          this.progress = false;
          return;
        }
        this.classes = docs;
        this.progress = false;
        stepper.next();
      });
  }

  formatPaperNumber = (paperNumber: Number): string => {
    if (paperNumber < 10) {
      return '0'.concat(paperNumber.toString());
    }
    return paperNumber.toString();
  }

  getPaperByGrade(stepper: MatVerticalStepper) {
    const grade = this.firstFormGroup.value.grade;
    const collectionRef = `papers/${grade}/paperNumbers/`;
    this._af.collection(collectionRef)
      .valueChanges({idField: 'id'})
      .subscribe(docs => {
        if (docs.length === 0) {
          this._message.ErrorMessage('No class data Found');
          this.progress2 = false;
          return;
        }
        this.papers = docs.map(r => {
          return {
            id: r.id.substr(4),
            paperNumber: r.id
          };
        });
        this.progress2 = false;
        stepper.next();
      });
  }


  compare(a, b) {
    if (a.mark < b.mark) {
      return 1;
    } else if (a.mark > b.mark) {
      return -1;
    } else {
      return 0;
    }
  }

  getTime(stepper: MatVerticalStepper) {
    console.log('here');
    stepper.next();
  }


  async submit(stepper: MatVerticalStepper) {
    try {

      const grade = this.firstFormGroup.value.grade;
      const className = this.secondFormGroup.value.class;
      const time = this.thirdFormGroup.value.time;
      const paperNumber = this.fourthFormGroup.value.paperNumber;

      const moments = moment(time);
      const day = moments.year().toString()
        .concat(this.formatPaperNumber(Number(moments.month())))
        .concat(this.formatPaperNumber(Number(moments.date())));

      const databasePath = `paperAccess/${className}/day/${day}`;

      const GradePaperAccessExists = await this._af.firestore
        .doc(`paperAccess/${className}`)
        .get();

      if (!GradePaperAccessExists.exists) {
        await this._af.doc(`paperAccess/${className}`).set({
          createdAt: firebase.firestore.FieldValue.serverTimestamp()
        });
      }

      const PaperData = await this._af.firestore
        .doc(`papers/${grade}/paperNumbers/${paperNumber}`)
        .get();

      const studentData = await this._af.firestore
        .collection(`class/${className}/students`)
        .get();

      const questions = PaperData.data().questions.length;

      const object = {
        access: true,
        endTime: time,
        paper: paperNumber,
        pastPaper: false,
        questions: questions,
      };

      await this._af.doc(databasePath).set(object);

      const references = studentData.docs.map(d => this._af.firestore.collection(`${databasePath}/students`).doc(d.id));

      while (references.length) {
        const referencesBatch = references.splice(0, 500);
        const batch = this._af.firestore.batch();
        for (const reference of referencesBatch) {
          batch.set(reference, {access: true});
        }
        await batch.commit();
      }

      this._message.NotificationMessage('Access enable successfully');
      this.endMessage = 'Access enable successfully';
      stepper.next();
    } catch (error) {
      this._message.NotificationMessage('Access enable Fail');
      this.endMessage = 'Access enable Fail';
      stepper.next();
    }
  }


}
