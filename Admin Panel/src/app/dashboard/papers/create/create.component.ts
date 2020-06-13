import {Component, OnInit, ViewChild} from '@angular/core';
import {FormArray, FormBuilder, FormControl, FormGroup, FormGroupDirective, Validators} from '@angular/forms';
import {AngularFirestore} from '@angular/fire/firestore';

import * as firebase from 'firebase';
import 'firebase/firestore';
import {MatDialog} from '@angular/material';

import {UploaderComponent} from '../../uploader/uploader.component';
import {NotificationService} from "../../services/notification.service";

@Component({
  selector: 'app-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css']
})
export class CreateComponent implements OnInit {
  @ViewChild(FormGroupDirective) formGroupDirective: FormGroupDirective;
  // create_form
  formGroup: FormGroup;
  form: FormArray;

  // show_hide_create_paper_stepper
  showCreatePaper = false;

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

  noOfQuestions = [
    {
      count: 20
    },
    {
      count: 40
    }
  ];
  progress = false;

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              public dialog: MatDialog,
              public notification: NotificationService) {
  }

  ngOnInit(): void {
    this.buildForm();
  }

  // create__form
  buildForm() {
    this.formGroup = this._fb.group({
      grade: new FormControl('', Validators.required),
      paperNumber: new FormControl('', Validators.required),
      noOfQuestions: new FormControl(0, Validators.required),
      form: this._fb.array([])
    });

  }

  // initialize_sub_form
  init(i) {
    return this._fb.group({
      number: new FormControl(i),
      question: new FormControl('', []),
      correctAnswer: new FormControl('', []),
      answer1: new FormControl('', []),
      answer2: new FormControl('', []),
      answer3: new FormControl('', []),
      answer4: new FormControl('', []),
      picture: new FormControl('', []),
    });
  }

  // add_new_sub_form_to_main_form
  addItem(i) {
    this.form = this.formGroup.get('form') as FormArray;
    this.form.push(this.init(i));
  }


  formatPaperNumber = (paperNumber) => {
    if (paperNumber < 10) {
      paperNumber = '0'.concat(paperNumber.toString());
    }
    return paperNumber;
  };


  submit() {


    // docRef_'papers/9/paperNumbers/202001
    // tslint:disable-next-line:max-line-length
    const docRef = `papers/${this.formGroup.value.grade}/paperNumbers/${new Date().getFullYear().toString().concat(this.formatPaperNumber(this.formGroup.value.paperNumber))}`;

    // first_check_exist_of_paper
    this._af
      .firestore.doc(docRef).get().then(docSnapshot => {
      if (docSnapshot.exists) {
        this.notification.NotificationMessage('paper already exist');
        // console.log('paper already exists');
      } else {
        this._af.doc(docRef).set({
          questions: this.form.value,
          createdAt: firebase.firestore.FieldValue.serverTimestamp(),
          updatedAt: null
        })
          .then(() => {
            this.notification.NotificationMessage('paper submit successfully');
            this.showCreatePaper = false;
            this.buildForm();
            setTimeout(() => this.formGroupDirective.resetForm(), 0)
          })
          .catch(console.log);
      }
    });
  }

  showPaper() {
    this.progress = true;
    const questionsCount = this.formGroup.value.noOfQuestions;
    console.log(questionsCount);
    for (let i = 0; i < questionsCount; i++) {
      this.addItem(i + 1);
    }

    // tslint:disable-next-line:max-line-length
    const docRef = `papers/${this.formGroup.value.grade}/paperNumbers/${new Date().getFullYear().toString().concat(this.formatPaperNumber(this.formGroup.value.paperNumber))}`;
    this._af.firestore
      .doc(docRef)
      .get()
      .then(documentSnapshot => {
        this.progress = false;
        if (documentSnapshot.exists) {
          this.notification.NotificationMessage('paper already exist');
          // console.log('document exists');
        } else {
          this.showCreatePaper = true;
        }
      });

  }

  openDialog(i) {

    const dialogRef = this.dialog.open(UploaderComponent, {
      width: '600px',
      data: {
        grade: this.formGroup.value.grade,
        paperNumber: this.formGroup.value.paperNumber,
        path: 'papers'
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      (<FormArray>this.formGroup.controls['form']).at(i).patchValue({picture: result.url});
    });
  }

  closeWindow() {
    this.showCreatePaper = false;
    this.formGroup.reset();
    this.buildForm();
    setTimeout(() => this.formGroupDirective.resetForm(), 0)
  }
}
