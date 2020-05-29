import {Component, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {NotificationService} from "../../services/notification.service";
import {AngularFirestore} from "@angular/fire/firestore";
import * as firebase from "firebase";

@Component({
  selector: 'app-update-class',
  templateUrl: './update-class.component.html',
  styleUrls: ['./update-class.component.css']
})
export class UpdateClassComponent implements OnInit, OnChanges {
  @Input() classDetails: ClassDetails;
  updateClass: FormGroup;
  classTypes: any[] = [
    {
      name: 'Group Class',
      type: 'Group'
    },
    {
      name: 'Master Class',
      type: 'Mass'
    },
    {
      name: 'Paper Class',
      type: 'Paper'
    }
  ];

  constructor(private _fb: FormBuilder,
              private _notification: NotificationService,
              private _af: AngularFirestore) {
  }

  ngOnInit(): void {
    this.buildUpdateClass();
  }

  buildUpdateClass() {
    this.updateClass = this._fb.group({
        name: new FormControl('', Validators.required),
        fees: new FormControl('', Validators.required),
        type: new FormControl('', Validators.required),
      },
    );
  }

  async ngOnChanges(changes: SimpleChanges) {

    if (changes.classDetails.currentValue !== changes.classDetails.previousValue) {
      this.classDetails = changes.classDetails.currentValue as ClassDetails;

      if (!this.updateClass) {
        await this.buildUpdateClass();
      }

      this.updateClass.patchValue(this.classDetails);

    }
  }

  submit() {
    this.updateClass.value.updatedAt = firebase.firestore.FieldValue.serverTimestamp();
    // console.log(this.updateClass.value);
    const classId = this.classDetails.grade.toString().concat('.').concat(this.classDetails.number.toString());
    this._af.firestore.doc(`class/${classId}`)
      .update(this.updateClass.value)
      .then( result => this._notification.NotificationMessage('update class details successfully'))
      .catch( error =>this._notification.ErrorMessage('update class details failed'));
  }
}

interface ClassDetails {
  name: string;
  fees: Number;
  type: string;
  grade: Number;
  number: Number;
}
