import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { Router } from '@angular/router';
import { AngularFirestore } from '@angular/fire/firestore';
import { MathsService } from '../maths.service';
import { DatePipe } from '@angular/common';
import * as firebase from 'firebase';
import { AngularFireFunctions } from '@angular/fire/functions';
import { Md5 } from 'ts-md5';


@Component({
  selector: 'app-dialogbox',
  templateUrl: './dialogbox.component.html',
  styleUrls: ['./dialogbox.component.css']
})
export class DialogboxComponent implements OnInit {


  isPaper;
  val = false;
  classN: string;
  userID: string;
  name: string;
  marks: any = 0;
  toggle: any;
  paper: any;
  data$: any;
  school: string;
  constructor(private router: Router,
              private af: AngularFirestore,
              private _math: MathsService,
              public dialog: MatDialog,
              private datePipe: DatePipe,
              private fns: AngularFireFunctions,
     ) {
       this.getData();
       this.classN = localStorage.getItem('class');
       this.userID = localStorage.getItem('userID');
       this.name = localStorage.getItem('name');
       this.school = localStorage.getItem('school');
       const retrivedToggle = localStorage.getItem('toggleKey');
       this.toggle = JSON.parse(retrivedToggle);

       const retrivedPaper = localStorage.getItem('paperKey');
       this.paper = JSON.parse(retrivedPaper);
     }

  ngOnInit(): void {
  }
  viewPaper(paper: string){
    if (paper === 'markingsheet'){
      this.checkMarks();
      // this.af.collection('class').doc(this.classN).collection('students').doc(this.userID).collection('marks')
      //   .doc((new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1))).set({
      //     createdAt: firebase.firestore.FieldValue.serverTimestamp(),
      //     mark: this.marks,
      //     date: this.datePipe.transform(new Date(), 'yyyy.MM.dd'),
      //     name: this.name,
      //   });
      // try {
      //   this.af.firestore.collection('marks').doc(localStorage.getItem('grade')).get().then((docSnapshot) => {
      //     if (!docSnapshot.exists) {
      //       this.af.collection('marks').doc(localStorage.getItem('grade')).set({}, { merge: true })
      //     }
      //   }).then(() => {
      //     // tslint:disable-next-line: no-unused-expression
      //     this.af.firestore.collection('marks').doc(localStorage.getItem('grade')).collection('paperNumbers')
      //       .doc((new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1)))
      //       .get().then(docSnapshot => {
      //         if (!docSnapshot.exists) {
      //           this.af.collection('marks').doc(localStorage.getItem('grade')).collection('paperNumbers')
      //             .doc((new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1))).set({
      //               date: this.datePipe.transform(new Date(), 'yyyy.MM.dd')
      //             });
      //         }
      //       }).then(() => {
      //         this.af.collection('marks').doc(localStorage.getItem('grade')).collection('paperNumbers')
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
      //   this.af.collection('marks').doc(localStorage.getItem('grade')).collection('paperNumbers')
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
        paperNumber: localStorage.getItem('paperNumber'),
        photo: '',
        school: this.school
      });
      this.data$.subscribe(async res => {
        if (res){
         console.log('su')
        }
      });
      this.router.navigate(['home']);
    } else{
      this.router.navigate([`${paper}`]);
    }

  }
  getData(){
    const retrivedPaper = localStorage.getItem('onKey');
    this.isPaper = JSON.parse(retrivedPaper);

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
