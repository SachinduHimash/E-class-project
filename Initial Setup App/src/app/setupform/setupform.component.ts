import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { FormGroup, FormBuilder, FormControl, Validators, FormGroupDirective, NgForm} from '@angular/forms';
import { AngularFireDatabase} from '@angular/fire/database';
import {AngularFirestore} from '@angular/fire/firestore';
import * as firebase from 'firebase';
import { Md5 } from 'ts-md5/dist/md5';
import { DatePipe } from '@angular/common';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { DialogboxComponent } from '../dialogbox/dialogbox.component';
import { ErrorStateMatcher } from '@angular/material/core';
import { AngularFireFunctions } from '@angular/fire/functions';



@Component({
  selector: 'app-setupform',
  templateUrl: './setupform.component.html',
  styleUrls: ['./setupform.component.css']
})
export class SetupformComponent implements OnInit {

  myform: FormGroup;
  selectClasses = [];
  isPaper;
  showDetails = true;
  classes: any[] =
  [
    {
      grade: 11,
      class: 'Warana Group Class',
      number: 2,
      type: 'Group'

    },
    {
      grade: 11,
      class: 'Warana Paper Class Only',
      number: 3,
      type: 'Paper'

    },
    {
      grade: 11,
      class: 'Sadhana Mass Class',
      number: 4,
      type: 'Mass'

    },
    {
      grade: 11,
      class: 'Sadhana Group Class',
      number: 5,
      type: 'Group'

    },
    {
      grade: 11,
      class: 'Sadhana Paper Class Only',
      number: 6,
      type: 'Paper'

    },
    {
      grade: 11,
      class: 'Susipka Mass Class',
      number: 7,

    },
    {
      grade: 11,
      class: 'Susipka Group Class',
      number: 8,
      type: 'Group'

    },
    {
      grade: 11,
      class: 'Susipka Paper Class Only',
      number: 9,
      type: 'Paper'

    },
    {
      grade: 10,
      class: 'Warana Class',
      number: 10,
      type: 'Mass'

    },
    {
      grade: 10,
      class: 'Sadhana Class',
      number: 11,
      type: 'Mass'

    },
    {
      grade: 10,
      class: 'Susipka Class',
      number: 12,
      type: 'Mass'

    },
    {
      grade: 9,
      class: 'Warana Class',
      number: 13,
      type: 'Mass'

    },
    {
      grade: 9,
      class: 'Sadhana Mass Class',
      number: 14,
      type: 'Mass'

    },
    {
      grade: 9,
      class: 'Susipka Class',
      number: 15,
      type: 'Mass'

    },
  ];
  matcher = new MyErrorStateMatcher();
  test1: string;
  test2: string;
  error1: any;
  error2: any;
  test3: string;
  test4: string;
  test5: string;
  test6: string;
  error3: any;
  error4: any;
  data$: any;

    // [
    // 'Warana Mass Class',
    // 'Warana Group Class',
    // 'Warana Paper Class Only',
    // 'Sadhana Mass Class',
    // 'Sadhana Group Class',
    // 'Sadhana Paper Class Only',
    // 'Susipka Mass Class',
    // 'Susipka Group Class',
    // 'Susipka Paper Class Only'
    // ];



  constructor(
    private fb: FormBuilder,
    public af: AngularFirestore,
    private datePipe: DatePipe,
    public dialog: MatDialog,
    private router: Router,
    private fns: AngularFireFunctions,
  ) {
    if (localStorage.getItem('first') === '1' && localStorage.getItem('second') === '1' ){
      router.navigate(['markingsheet']);
    } else if (localStorage.getItem('first') === '1') {
      router.navigate(['paper']);
    }
  }

  ngOnInit() {
    this.myform = this.fb.group({
      userID: new FormControl('', Validators.required),
      fullName: new FormControl('', Validators.required),
      school: new FormControl('', Validators.required),
      address: new FormControl('', Validators.required),
      grade: new FormControl('', Validators.required),
      teleNo: new FormControl('', [Validators.required, Validators.minLength(10)]),
      class: new FormControl('', Validators.required),
      password: new FormControl('', [Validators.required, Validators.minLength(8)]),
      cpassword: new FormControl('' ),
    }, { validator: this.checkPasswords });
    }

  checkPasswords(group: FormGroup) { // here we have the 'passwords' group
    const pass = group.get('password').value;
    const confirmPass = group.get('cpassword').value;

    return pass === confirmPass ? null : { notSame: true };
  }


  getclass(x){
    this.myform.value.class = null;
    this.selectClasses = [];
    this.classes.forEach(element => {
      if ( element.grade === x ){
        this.selectClasses.push(element);
      }
    });
  }

    async submit(){
    const formValue = this.myform.value;
    const userID = formValue.userID;
    const newClass = (formValue.grade.toString()).concat('.').concat(this.myform.value.class.number);
    localStorage.setItem('class', newClass);
    localStorage.setItem('userID', userID);
    localStorage.setItem('name', formValue.fullName);
    this.test1 = 'test1';

    // try {
    //   this.af.firestore.collection('users').doc(userID).get().then(docSnapshot => {
    //      this.test2 = 'test2';
    //      if (!docSnapshot.exists) {
    //        this.test3 = 'test3';
    //        this.af.doc(`users/${userID}`)
    //          .set({
    //            createdAt: firebase.firestore.FieldValue.serverTimestamp(),
    //            fullName: formValue.fullName,
    //            school: formValue.school,
    //            address: formValue.address,
    //            teleNo: formValue.teleNo,
    //            class: newClass,
    //            password: Md5.hashStr(formValue.password),
    //            role: 'student'
    //          }).then(() => {
    //            this.af.firestore.collection('class').doc(newClass).get().then(docSnapshot1 => {
    //              if (!docSnapshot1.exists) {
    //                this.af.collection('class').doc(newClass).set({
    //                  name: this.myform.value.class.class,
    //                  number: +this.myform.value.class.number,
    //                  grade: +this.myform.value.grade,
    //                  createdAt: firebase.firestore.FieldValue.serverTimestamp(),
    //                  fees: 1500,
    //                  type: this.myform.value.class.type
    //                }).catch((err) => this.error1 = err);
    //              }
    //            }).then(() => {
    //               this.af.collection('class').doc(newClass).collection('students').doc(userID).set({
    //                createdAt: firebase.firestore.FieldValue.serverTimestamp(),
    //                fullName: formValue.fullName,
    //                year: +this.datePipe.transform(new Date(), 'yyyy').toString() + 11 - this.myform.value.grade
    //              });
    //            });
    //          }).catch((err) => this.error2 = err);
    //        localStorage.setItem('first', '1');
    //        localStorage.setItem('grade', this.myform.value.grade);
    //        this.isPaper = true;
    //        localStorage.setItem('onKey', JSON.stringify(this.isPaper));
    //        this.dialog.open(DialogboxComponent);
    //      } else {
    //        this.test4 = 'test4';
    //        this.isPaper = true;
    //        localStorage.setItem('onKey', JSON.stringify(this.isPaper));
    //        localStorage.ssetItem('first', '1');
    //        this.af.collection('users').doc(userID).valueChanges().subscribe((doc) => {
    //          localStorage.setItem('grade', doc['class'].split('.')[0]);
    //          this.router.navigate(['paper']);
    //        });
    //      }
    //      this.test5 = 'test5';
    // }).catch((err) => this.error3 = err);
    // } catch (error) {
    //   this.error4 = error;
    //   this.af.doc(`users/${userID}`)
    //    .set({
    //      createdAt: firebase.firestore.FieldValue.serverTimestamp(),
    //      fullName: formValue.fullName,
    //      school: formValue.school,
    //      address: formValue.address,
    //      teleNo: formValue.teleNo,
    //      class: newClass,
    //      password: Md5.hashStr(formValue.password),
    //      role: 'student'
    //    });
    //   this.af.collection('class').doc(newClass).collection('students').doc(userID).set({
    //    createdAt: firebase.firestore.FieldValue.serverTimestamp(),
    //    fullName: formValue.fullName,
    //    year: +this.datePipe.transform(new Date(), 'yyyy').toString() + 11 - this.myform.value.grade
    //  });
    //   localStorage.setItem('first', '1');
    //   localStorage.setItem('grade', this.myform.value.grade);
    //   this.dialog.open(DialogboxComponent);
    // }
    const callable = this.fns.httpsCallable('login/registration');
    this.data$ = callable({
      userID: formValue.userID,
      class: formValue.class,
      fullName: formValue.fullName,
      school: formValue.school,
      address: formValue.address,
      teleNo: formValue.teleNo,
      password: Md5.hashStr(formValue.password),
      grade: formValue.grade
    });
    this.test1 = 'test1';
    try {
      await this.data$.subscribe(res => {
        this.test2 = 'test2';
        if (!res.err) {
          this.test3 = 'test3';
          localStorage.setItem('first', '1');
          localStorage.setItem('grade', this.myform.value.grade);
          this.isPaper = true;
          localStorage.setItem('onKey', JSON.stringify(this.isPaper));
          this.dialog.open(DialogboxComponent);
        } else {
          if (res.err === 'user already exists') {
            this.test4 = 'test4';
            this.isPaper = true;
            localStorage.setItem('onKey', JSON.stringify(this.isPaper));
            localStorage.setItem('first', '1');
            this.af.collection('users').doc(userID).valueChanges().subscribe((doc) => {
              localStorage.setItem('grade', doc['class'].split('.')[0]);
              this.router.navigate(['paper']);
            });
          }
        }
        this.test5 = 'test5';
      });
    } catch (error) {
      this.error1 =error;
    }

    this.test6 = 'test6';


    this.isPaper = true;
    localStorage.setItem('onKey', JSON.stringify(this.isPaper));
    this.test6 = 'test6';
  }
}

export class MyErrorStateMatcher implements ErrorStateMatcher {
  isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
    const invalidCtrl = !!(control && control.invalid && control.parent.dirty);
    const invalidParent = !!(control && control.parent && control.parent.invalid && control.parent.dirty);

    return (invalidCtrl || invalidParent);
  }
}
