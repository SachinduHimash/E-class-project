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
  val = false;

  // submitting the paper
  submitted = false;
  marks = 0;
  name: string;
  timeOutIDs: any[] = [];
  data$: any;
  paperNumber;
  grade: string;
  school: string;

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              private _math: MathsService,
              private router: Router,
              public dialog: MatDialog,
              private datePipe: DatePipe,
              private fns: AngularFireFunctions, ) {
    if (!localStorage.getItem('userID')) {
      router.navigate(['']);
    }
    this.classN = localStorage.getItem('class');
    this.userID = localStorage.getItem('userID');
    this.name = localStorage.getItem('name');
    this.grade = localStorage.getItem('grade');
    this.school = localStorage.getItem('school');
    this.getPaper();
    // if (localStorage.getItem('first') === '1' && localStorage.getItem('second') === '1') {
    //   router.navigate(['markingsheet']);
    // } else if (localStorage.getItem('first') === '1') {
    //   this.getPaper();
    // } else {
    //   router.navigate(['']);
    // }
    // if (localStorage.getItem('toggleKey')){
    //   const retrivedToggle = localStorage.getItem('toggleKey');
    //   this.toggle = JSON.parse(retrivedToggle);
    // }


  }

  ngOnInit() {
    
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
  async getPaper() {
    // const formValue = this.updateFormGroup.value;
    const year = new Date().getFullYear();
    const month = new Date().getMonth().toString().length === 1 ? ('0' + (new Date().getMonth() + 1)) : (new Date().getMonth() + 1).toString();
    const day = new Date().getDate().toString();
    const today = year + month + day;
    
    // tslint:disable-next-line: max-line-length
    this._af.collection('paperAccess').doc(this.grade).collection('day').doc(today).valueChanges().subscribe((doc) => {
      if (doc == null){
        alert('You don\'t have any papers today');
        this.router.navigate(['home']);
      } else {
        this._af.collection('papers').doc(this.grade).collection('paperNumbers').doc(doc['paper']).valueChanges()
          .subscribe((doc1) => {
            this.paper = doc1['questions'];
            this.paperNumber = doc1['paperNumber'];
            localStorage.setItem('paperNumber', doc['paper']);
            this._af.collection('class').doc(this.classN).collection('students').doc(this.userID).collection('marks').doc(doc['paper'])
              .valueChanges()
              .subscribe((doc2) => {
                if (doc2) {
                  alert('paper allredy done');
                  this.router.navigate(['home']);
                }
                else {
                  if (doc['questions'] === 40){
                    this.timeOutIDs.push(
                      setTimeout(() => this.submitTimeout(), 3600000)
                    );
                  } else {
                    console.log('ddd')
                    this.timeOutIDs.push(
                      setTimeout(() => this.submitTimeout(), 1800000)
                    );
                  }
                  localStorage.removeItem('toggleKey');
                }
              });
          });
      }
    });
    // await this.af.collection('papers').doc(this.grade).
    //   collection('paperNumbers', ref => ref.orderBy('createdAt', 'desc').limit(1))
    //   .valueChanges({ idField: 'paperNumber' })
    //   .subscribe( (doc) => {
    //     this.paper = doc[0].questions;
    //     this.paperNumber = doc[0].paperNumber;
    //     localStorage.setItem('paperNumber', this.paperNumber);
    //     this._af.collection('class').doc(this.classN).collection('students').doc(this.userID).collection('marks').doc(this.paperNumber)
    //       .valueChanges()
    //       .subscribe((doc) => {
    //         if (doc) {
    //           alert('paper allredy done');
    //           this.router.navigate(['home']);
    //         }
    //         else{
    //           localStorage.removeItem('toggleKey');
    //         }
    //       });
    //   });



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
    localStorage.setItem('paperKey', JSON.stringify(this.paper));
    localStorage.setItem('toggleKey', JSON.stringify(this.toggle));



    this.dialog.open(DialogboxComponent);
  }

  submitTimeout() {
    this.timeOutIDs.forEach(id => clearTimeout(id));
    localStorage.setItem('paperKey', JSON.stringify(this.paper));
    localStorage.setItem('toggleKey', JSON.stringify(this.toggle));
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

    const callable = this.fns.httpsCallable('login/marks');
    this.data$ = callable({
      userID: this.userID,
      marks: this.marks,
      name: this.name,
      class: this.classN,
      answer: this.toggle,
      grade: localStorage.getItem('grade'),
      paperNumber: this.paperNumber,
      photo: '',
      school: this.school
    });
    this.data$.subscribe(async res => {
      if (res){
        console.log('su');
      }
    });
    this.router.navigate(['home']);

  }

  checkMarks() {
    if (!this.val){
      this.val = true;
      for (let index = 0; index < 20; index++) {
        if (this.toggle[index] === this.paper[index].correctAnswer) {
          this.marks += 5;
        }
      }
    }

  }

}
