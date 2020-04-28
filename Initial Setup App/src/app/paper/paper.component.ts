import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {AngularFirestore} from '@angular/fire/firestore';
import { Router } from '@angular/router';

// typeDefinition
import {Papers} from '../interfaces/databaseInterfaces';

import {MathsService} from '../maths.service';
import { MatDialog } from '@angular/material/dialog';
import { DialogboxComponent } from '../dialogbox/dialogbox.component';
import * as firebase from 'firebase';
import { DatePipe } from '@angular/common';
import { AngularFireFunctions } from '@angular/fire/functions';

@Component({
  selector: 'app-paper',
  templateUrl: './paper.component.html',
  styleUrls: ['./paper.component.css']
})


export class PaperComponent implements OnInit {
  isPaper;
  classN;
  userID;

 // toggles to color buttons

  toggle: any[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];


  // fetched_paper_data;
  paper;

  // submitting the paper
  submitted = false;
  marks = 0;
  name: string;
  timeOutIDs: any[] = [];
  data$: any;

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              private _math: MathsService,
              private router: Router,
              public dialog: MatDialog,
              private datePipe: DatePipe,
              private fns: AngularFireFunctions, ) {
    if (localStorage.getItem('first') === '1' && localStorage.getItem('second') === '1') {
      router.navigate(['markingsheet']);
    } else if (localStorage.getItem('first') === '1') {
      this.getPaper();
    } else {
      router.navigate(['']);
    }
    if (localStorage.getItem('toggleKey')){
      const retrivedToggle = localStorage.getItem('toggleKey');
      this.toggle = JSON.parse(retrivedToggle);
    }
    this.classN = localStorage.getItem('class');
    this.userID = localStorage.getItem('userID');
    this.name = localStorage.getItem('name');

  }

  ngOnInit() {
    this.timeOutIDs.push(
      setTimeout(() => this.submitTimeout(), 1800000)
    );
  }


  formatPaperNumber = (paperNumber) => {
    if (paperNumber < 10) {
      paperNumber = '0'.concat(paperNumber.toString());
    }
    return paperNumber;
  }


  isMobileMenu() {
    if (screen.width > 991) {
      return false;
    }
    return true;
  }

  // get_old_paper_data
  getPaper() {

    // const formValue = this.updateFormGroup.value;

    // tslint:disable-next-line:max-line-length
    const docPath = `papers/${localStorage.getItem('grade')}/paperNumbers/${(new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1))}`;

    this._af.doc(docPath)
      .valueChanges()
      .subscribe( (doc: Papers) => {
        this.paper =  doc.questions;
      });

  }

  // checking answers

  checkAnswer(question: number, choice: number){

    this.toggle[question - 1] = choice;
    localStorage.setItem('toggleKey', JSON.stringify(this.toggle));

  }

  // submit

  submit(){
    this.timeOutIDs.forEach(id => clearTimeout(id));
    this.isPaper = false;
    localStorage.setItem('onKey', JSON.stringify(this.isPaper));
    localStorage.setItem('paperKey', JSON.stringify(this.paper));
    localStorage.setItem('toggleKey', JSON.stringify(this.toggle));
    localStorage.setItem('second', '1');



    this.dialog.open(DialogboxComponent);
  }

  submitTimeout() {
    this.timeOutIDs.forEach(id => clearTimeout(id));
    localStorage.setItem('paperKey', JSON.stringify(this.paper));
    localStorage.setItem('toggleKey', JSON.stringify(this.toggle));
    localStorage.setItem('second', '1');
    alert('Time is over');
    this.checkMarks();




    // this._af.collection('class').doc(this.classN).collection('students').doc(this.userID).collection('marks')
    // .doc((new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1))).set({
    //   createdAt: firebase.firestore.FieldValue.serverTimestamp(),
    //   mark: this.marks,
    //   date: this.datePipe.transform(new Date(), 'yyyy.MM.dd'),
    //   name: this.name,
    // });

    // try {
    //   this._af.firestore.collection('marks').doc(localStorage.getItem('grade')).get().then(docSnapshot => {
    //     if (!docSnapshot.exists) {
    //       this._af.collection('marks').doc(localStorage.getItem('grade')).set({}, { merge: true });
    //     }
    //   }).then(() => {
    //     // tslint:disable-next-line: no-unused-expression
    //     this._af.firestore.collection('marks').doc(localStorage.getItem('grade')).collection('paperNumbers')
    //       .doc((new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1)))
    //       .get().then(docSnapshot => {
    //         if (!docSnapshot.exists) {
    //           this._af.collection('marks').doc(localStorage.getItem('grade')).collection('paperNumbers')
    //             .doc((new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1))).set({
    //               date: this.datePipe.transform(new Date(), 'yyyy.MM.dd')
    //             });
    //         }
    //       }).then(() => {
    //         this._af.collection('marks').doc(localStorage.getItem('grade')).collection('paperNumbers')
    //           .doc((new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1))).collection('students')
    //           .doc(this.userID).set({
    //             createdAt: firebase.firestore.FieldValue.serverTimestamp(),
    //             mark: this.marks,
    //             date: this.datePipe.transform(new Date(), 'yyyy.MM.dd'),
    //             name: this.name
    //           });
    //       });
    //   });
    // } catch (error) {
    //   this._af.collection('marks').doc(localStorage.getItem('grade')).collection('paperNumbers')
    //     .doc((new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1))).collection('students')
    //     .doc(this.userID).set({
    //       createdAt: firebase.firestore.FieldValue.serverTimestamp(),
    //       mark: this.marks,
    //       date: this.datePipe.transform(new Date(), 'yyyy.MM.dd'),
    //       name: this.name
    //     });
    // }

    const callable = this.fns.httpsCallable('marks');
    this.data$ = callable({
      userID: this.userID,
      marks: this.marks,
      name: this.name,
      class: this.classN,
      grade: localStorage.getItem('grade')
    });
    this.data$.subscribe(async res => {
      this.router.navigate(['markingsheet']);
    });


  }

  checkMarks() {
    for (let index = 0; index < this.toggle.length; index++) {
      if (this.toggle[index] === this.paper[index].correctAnswer) {
        this.marks += 5;
      }
    }
  }

}
