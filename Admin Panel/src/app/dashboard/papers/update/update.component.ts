import {Component, OnInit} from '@angular/core';
import {FormArray, FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {AngularFirestore} from '@angular/fire/firestore';
import {MatDialog} from '@angular/material';
import {UploaderComponent} from '../../uploader/uploader.component';
import * as firebase from 'firebase';
import {NotificationService} from "../../services/notification.service";

@Component({
  selector: 'app-update',
  templateUrl: './update.component.html',
  styleUrls: ['./update.component.css']
})
export class UpdateComponent implements OnInit {

  // create_form
  updateFormGroup: FormGroup;
  updateForm: FormArray;

  // show_hide_update_form
  showUpdateForm = false;

  // dropdown_selector
  correctAnswer = [
    {
      number: 1,
      name: 'Answer 1'
    },
    {
      number: 2,
      name: 'Answer 2'
    },
    {
      number: 3,
      name: 'Answer 3'
    },
    {
      number: 4,
      name: 'Answer 4'
    },
  ];

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              public dialog: MatDialog,
              public notification: NotificationService) {
  }

  ngOnInit() {
    this.buildUpdateForm();
  }


  formatPaperNumber = (paperNumber) => {
    if (paperNumber < 10) {
      paperNumber = '0'.concat(paperNumber.toString());
    }
    return paperNumber;
  };


  // Update_paper_section

  buildUpdateForm() {
    this.updateFormGroup = this._fb.group({
      grade: new FormControl('', Validators.required),
      paperNumber: new FormControl('', Validators.required),
      form: this._fb.array([])
    });
  }

  // get_old_paper_data_to_update
  getOldPaper() {

    const formValue = this.updateFormGroup.value;

    // tslint:disable-next-line:max-line-length
    const docPath = `papers/${formValue.grade}/paperNumbers/${(new Date().getFullYear()).toString().concat(this.formatPaperNumber(this.updateFormGroup.value.paperNumber))}`;

    this._af.firestore
      .doc(docPath)
      .get()
      .then(async (documentSnapshot) => {

        if (documentSnapshot.exists) {
          const docs = documentSnapshot.data();
          this.updateForm = this.updateFormGroup.get('form') as FormArray;
          // @ts-ignore
          await docs.questions.map(doc => {
            this.updateForm.push(this._fb.group({
              number: new FormControl(doc.number || ''),
              question: new FormControl(doc.question || '', []),
              correctAnswer: new FormControl(doc.correctAnswer || '', []),
              answer1: new FormControl(doc.answer1 || '', []),
              answer2: new FormControl(doc.answer2 || '', []),
              answer3: new FormControl(doc.answer3 || '', []),
              answer4: new FormControl(doc.answer4 || '', []),
              picture: new FormControl(doc.picture || '', []),
            }));
          });
          this.showUpdateForm = true;
        } else {
          this.notification.NotificationMessage('paper not found');
        }
      });


  }

  openUpdateDialog(i) {

    const dialogRef = this.dialog.open(UploaderComponent, {
      width: '600px',
      data: {
        grade: this.updateFormGroup.value.grade,
        paperNumber: this.updateFormGroup.value.paperNumber,
        path: 'papers'
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      (<FormArray>this.updateFormGroup.controls['form']).at(i).patchValue({picture: result.url});
    });
  }

  submitUpdateForm() {
    console.log(this.updateFormGroup.value);
    // tslint:disable-next-line:max-line-length
    const docRef = `papers/${this.updateFormGroup.value.grade}/paperNumbers/${new Date().getFullYear().toString().concat(this.formatPaperNumber(this.updateFormGroup.value.paperNumber))}`;
    this._af.doc(docRef).set({
      questions: this.updateFormGroup.value.form,
      updatedAt: firebase.firestore.FieldValue.serverTimestamp(),
    }, {merge: true})
      .then(() => {
        this.notification.NotificationMessage('paper update successfully');
        this.showUpdateForm = false;
        this.updateFormGroup.reset();
        this.updateFormGroup.clearValidators();
      })
      .catch((e) => {
        this.notification.NotificationMessage('Fail to update paper');
      });

  }
}
