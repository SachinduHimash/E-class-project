import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {MatVerticalStepper} from '@angular/material/stepper';
import * as moment from 'moment';
import * as firebase from 'firebase';
import {AngularFirestore} from '@angular/fire/firestore';
import {NotificationService} from '../../services/notification.service';

@Component({
  selector: 'app-create-access',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css']
})
export class CreateAccessComponent implements OnInit {

  endMessage: string;
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
  progress3: boolean;
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
    this.fourthFormGroup = this._fb.group({
      paperNumber: ['', Validators.required]
    });
  }

  formatPaperNumber = (paperNumber: Number): string => {
    if (paperNumber < 10) {
      return '0'.concat(paperNumber.toString());
    }
    return paperNumber.toString();
  }

  getPaperByGrade(stepper: MatVerticalStepper) {
    this.progress = true;
    const grade = this.firstFormGroup.value.grade;
    const collectionRef = `papers/${grade}/paperNumbers/`;
    this._af.collection(collectionRef)
      .valueChanges({idField: 'id'})
      .subscribe(docs => {
        if (docs.length === 0) {
          this._message.ErrorMessage('No class data Found');
          this.progress = false;
          return;
        }
        this.papers = docs.map(r => {
          return {
            id: r.id.substr(4),
            paperNumber: r.id
          };
        });
        this.progress = false;
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
      this.progress3 = true;
      const grade = this.firstFormGroup.value.grade;
      const paperNumber = this.fourthFormGroup.value.paperNumber;

      const databasePath = `paperAccess/${grade}/paper/${this.formatPaperNumber(paperNumber)}`;

      const ClassPaperAccessExists = await this._af.firestore
        .doc(`paperAccess/${grade}`)
        .get();

      const DayPaperAccessExists = await this._af.firestore
        .doc(databasePath)
        .get();

      if (DayPaperAccessExists.exists) {
        await this._af.doc(databasePath).update({
          access: true,
        });
        this.endMessage = 'Access enable successfully';
        stepper.next();
        this.progress3 = false;
        return this._message.NotificationMessage('Access enable successfully');
      }

      if (!ClassPaperAccessExists.exists) {
        await this._af.doc(`paperAccess/${grade}`).set({
          createdAt: firebase.firestore.FieldValue.serverTimestamp()
        });
      }

      const PaperData = await this._af.firestore
        .doc(`papers/${grade}/paperNumbers/${paperNumber}`)
        .get();

      // const studentData = await this._af.firestore
      //   .collection(`class/${className}/students`)
      //   .get();

      const questions = PaperData.data().questions.length;

      const object = {
        access: true,
        endTime: firebase.firestore.FieldValue.serverTimestamp(),
        paper: paperNumber,
        pastPaper: false,
        questions: questions,
      };

      await this._af.doc(databasePath).set(object);

      // const references = studentData.docs.map(d => this._af.firestore.collection(`${databasePath}/students`).doc(d.id));
      //
      // while (references.length) {
      //   const referencesBatch = references.splice(0, 500);
      //   const batch = this._af.firestore.batch();
      //   for (const reference of referencesBatch) {
      //     batch.set(reference, {access: true});
      //   }
      //   await batch.commit();
      // }

      this._message.NotificationMessage('Access enable successfully');
      this.endMessage = 'Access enable successfully';
      stepper.next();
      this.progress3 = false;
    } catch (error) {
      console.log(error);
      error.message ? this._message.NotificationMessage(error.message) : this._message.NotificationMessage('Access enable Fail');
      this.endMessage = 'Access enable Fail';
      stepper.next();
      this.progress3 = false;
    }
  }

}
