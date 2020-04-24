import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { Router } from '@angular/router';
import { AngularFirestore } from '@angular/fire/firestore';
import { MathsService } from '../maths.service';
import { DatePipe } from '@angular/common';
import * as firebase from 'firebase';


@Component({
  selector: 'app-dialogbox',
  templateUrl: './dialogbox.component.html',
  styleUrls: ['./dialogbox.component.css']
})
export class DialogboxComponent implements OnInit {


  isPaper;
  classN: string;
  userID: string;
  name: string;
  marks: any = 0;
  toggle: any;
  paper: any;
  constructor(private router: Router,
              private af: AngularFirestore,
              private _math: MathsService,
              public dialog: MatDialog,
              private datePipe: DatePipe
     ) {
       this.getData();
       this.classN = localStorage.getItem('class');
       this.userID = localStorage.getItem('userID');
       this.name = localStorage.getItem('name');
       const retrivedToggle = localStorage.getItem('toggleKey');
       this.toggle = JSON.parse(retrivedToggle);

       const retrivedPaper = localStorage.getItem('paperKey');
       this.paper = JSON.parse(retrivedPaper);
     }

  ngOnInit(): void {
  }
  viewPaper(paper:string): void {
    if (paper === 'markingsheet'){
      this.checkMarks();
      this.af.collection('class').doc(this.classN).collection('students').doc(this.userID).collection('marks')
        .doc((new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1))).set({
          createdAt: firebase.firestore.FieldValue.serverTimestamp(),
          mark: this.marks,
          date: this.datePipe.transform(new Date(), 'yyyy.MM.dd'),
          name: this.name,
        });


      this.af.collection('marks').doc(localStorage.getItem('grade')).ref.get().then((docSnapshot) => {
        if (!docSnapshot.exists) {
          this.af.collection('marks').doc(localStorage.getItem('grade')).set({}, { merge: true })
        }
      }).then(() => {
        // tslint:disable-next-line: no-unused-expression
        this.af.collection('marks').doc(localStorage.getItem('grade')).collection('paperNumbers')
          .doc((new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1)))
          .ref.get().then((docSnapshot) => {
            if (!docSnapshot.exists) {
              this.af.collection('marks').doc(localStorage.getItem('grade')).collection('paperNumbers')
                .doc((new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1))).set({
                  date: this.datePipe.transform(new Date(), 'yyyy.MM.dd')
                });
            }
          }).then(() => {
            this.af.collection('marks').doc(localStorage.getItem('grade')).collection('paperNumbers')
              .doc((new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(1))).collection('students')
              .doc(this.userID).set({
                createdAt: firebase.firestore.FieldValue.serverTimestamp(),
                mark: this.marks,
                date: this.datePipe.transform(new Date(), 'yyyy.MM.dd'),
                name: this.name
              });
          });
      });
    }
    this.router.navigate([`${paper}`]);

  }
  getData(){
    const retrivedPaper = localStorage.getItem('onKey');
    this.isPaper = JSON.parse(retrivedPaper);

  }

  checkMarks() {
    for (let index = 0; index < this.toggle.length; index++) {
      if (this.toggle[index] === this.paper[index].correctAnswer) {
        this.marks += 5;
      }
    }
  }
}
