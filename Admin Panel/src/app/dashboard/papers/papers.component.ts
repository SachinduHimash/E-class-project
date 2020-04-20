import {Component, OnInit} from '@angular/core';
import {FormArray, FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {AngularFirestore} from '@angular/fire/firestore';

import * as firebase from 'firebase';
import 'firebase/firestore';
import {MatDialog} from '@angular/material';

import {UploaderComponent} from '../uploader/uploader.component';

@Component({
  selector: 'app-papers',
  templateUrl: './papers.component.html',
  styleUrls: ['./papers.component.css']
})
export class PapersComponent implements OnInit {

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

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              public dialog: MatDialog) {
  }

  ngOnInit() {
    this.buildForm();
  }

  // create_main_form
  buildForm() {
    this.formGroup = this._fb.group({
      grade: new FormControl('', Validators.required),
      paperNumber: new FormControl('', Validators.required),
      form: this._fb.array([])
    });
    for (let i = 0; i < 20; i++) {
      this.addItem(i + 1);
    }
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


  submit() {

    console.log(this.formGroup.value)

    // let paperNumber = this.formGroup.value.paperNumber;
    //
    // if (paperNumber < 10) {
    //   paperNumber = '0'.concat(paperNumber.toString());
    // }
    //
    // // docRef_'papers/9/paperNumbers/202001
    // // tslint:disable-next-line:max-line-length
    // const docRef = `papers/${this.formGroup.value.grade}/paperNumbers/${new Date().getFullYear().toString().concat(paperNumber)}`;
    //
    // // first_check_exist_of_paper
    // this._af
    //   .firestore.doc(docRef).get().then(docSnapshot => {
    //   if (docSnapshot.exists) {
    //     console.log('paper already exists');
    //   } else {
    //     this._af.doc(docRef).set({
    //       questions: this.form.value,
    //       createdAt: firebase.firestore.FieldValue.serverTimestamp(),
    //       updatedAt: null
    //     }).catch(console.log);
    //   }
    // });
  }

  showPaper() {
    let paperNumber = this.formGroup.value.paperNumber;

    if (paperNumber < 10) {
      paperNumber = '0'.concat(paperNumber.toString());
    }

    // docRef_'papers/9/paperNumbers/202001
    // tslint:disable-next-line:max-line-length
    const docRef = `papers/${this.formGroup.value.grade}/paperNumbers/${new Date().getFullYear().toString().concat(paperNumber)}`;
    this._af.firestore
      .doc(docRef)
      .get()
      .then(documentSnapshot => {
        if (documentSnapshot.exists) {
          console.log('document exists');
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
      this.formGroup.get('form')[i].picture = result.url ;
    });
  }

  ch(v) {
    console.log(v)
  }
}
