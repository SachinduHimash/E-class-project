import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {AngularFirestore} from '@angular/fire/firestore';
import {NotificationService} from '../../services/notification.service';
import {MatVerticalStepper} from '@angular/material/stepper';
import * as moment from 'moment';
import * as firebase from 'firebase';

@Component({
  selector: 'app-update-access',
  templateUrl: './update.component.html',
  styleUrls: ['./update.component.css']
})
export class UpdateAccessComponent implements OnInit {

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
    this.thirdFormGroup = this._fb.group({
      time: ['', Validators.required]
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
  };

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


  async submit(stepper: MatVerticalStepper) {
    try {
      this.progress3 = true;

      const grade = this.firstFormGroup.value.grade;
      const paperNumber = this.fourthFormGroup.value.paperNumber;
      const time = this.thirdFormGroup.value.time;

      const moments = moment(time);
      const day = moments.year().toString()
        .concat(this.formatPaperNumber(Number(moments.month()) + 1))
        .concat(this.formatPaperNumber(Number(moments.date())));

      const databasePath = `paperAccess/${grade}/day/${day}`;

      const DayPaperAccessExists = await this._af.firestore
        .doc(databasePath)
        .get();

      if (!DayPaperAccessExists.exists) {
        throw {
          message: 'Paper Access is not exists'
        };
      }

      const object = {
        access: false,
        updatedAt: firebase.firestore.FieldValue.serverTimestamp()
      };

      await this._af.doc(databasePath).update(object);


      this._message.NotificationMessage('Disable access successfully');
      this.endMessage = 'Update successfully';
      stepper.next();
      this.progress3 = false;

    } catch (error) {

      console.log(error);
      error.message ? this._message.NotificationMessage(error.message) : this._message.NotificationMessage('Update Fail');
      this.endMessage = 'Update Fail';
      stepper.next();
      this.progress3 = false;
    }
  }
}
