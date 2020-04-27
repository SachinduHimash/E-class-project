import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {AngularFirestore} from '@angular/fire/firestore';

// use_for_timestamp
import * as firebase from 'firebase';
import 'firebase/firestore';
import {take} from 'rxjs/operators';
import {NotificationService} from '../services/notification.service';

@Component({
  selector: 'app-classes',
  templateUrl: './classes.component.html',
  styleUrls: ['./classes.component.css']
})
export class ClassesComponent implements OnInit {

  // forms
  createClass: FormGroup;
  // class_type
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

  // list_of_classes
  classes: any;
  testClass: any[] = [];

  // show_hide_add_class
  addClassShow = false;
  buttonText = 'Insert class';

  // class_detail
  showClassDetail = false;
  classNumber: any;

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              private _notification: NotificationService) {
  }

  ngOnInit(): void {
    this.fetchClasses();
    this.buildCreateClass();
  }

  buildCreateClass() {
    this.createClass = this._fb.group({
        grade: new FormControl('', Validators.required),
        name: new FormControl('', Validators.required),
        fees: new FormControl('', Validators.required),
        type: new FormControl('', Validators.required),
      },
    );
  }

  async submit() {
    const formValue = this.createClass.value;
    try {
      this.classes = this._af.collection('class', ref => ref.where('grade', '==', formValue.grade))
        .valueChanges()
        .pipe(take(1))
        .subscribe((docs) => {

          docs.map((doc) => {
            // @ts-ignore
            if (doc.name && doc?.name.toLowerCase() === formValue.name.toLowerCase()) {
              this._notification.ErrorMessage('class name already exists');
              throw new Error('class name already exists');
            }
          });
          console.log(docs);
          // @ts-ignore
          const number = Number(docs.reduce((max, p) => p.number > max ? p.number : max, 0)) + 1;
          console.log(number);
          const docId = formValue.grade.toString().concat('.').concat(number.toString());
          this._af.collection('class').doc(docId).set({
            name: formValue.name,
            number,
            grade: formValue.grade,
            createdAt: firebase.firestore.FieldValue.serverTimestamp(),
            fees: formValue.fees,
            type: formValue.type
          }).then(() => {
            this.createClass.reset();
            this.createClass.clearValidators();
            this._notification.NotificationMessage('successfully added');
          })
            .catch((err) => this._notification.ErrorMessage(err));
        });
    } catch (e) {
    }
  }

  fetchClasses() {

    this.classes = this._af.collection('class')
      .valueChanges({idField: 'id'});

    const nm = this.classes;

    nm.subscribe((docs) => {
      console.log(docs);
      this.testClass = [];
      docs = docs.map((data) => {
        const grade = data.id.toString().split('.')[0];
        return {...data, grade};
      }).map((doc) => {
        const classFound = this.testClass.find(classes => classes['grade'] === doc.grade);
        classFound ? classFound.name.push(doc) : this.testClass.push({grade: doc.grade, name: [doc]});
      });
    });
  }

  // show_hide_add_class_content

  showAddClass() {
    this.addClassShow ? this.buttonText = 'Insert class' : this.buttonText = 'Hide form';
    this.addClassShow = !this.addClassShow;
    if (this.addClassShow) {
      this.showClassDetail = false;
    }
  }

  showClassData(doc) {
    this.classNumber = doc.grade.toString().concat('.').concat(doc.number.toString());
    this.showClassDetail = true;
    this.addClassShow = false;
  }
}


// v_01

// submit() {
//
//   const formValue = this.createClass.value;
//
//   // crete_doc_id_format_'grade.name'
//   const grade = formValue.grade.toString();
//   const name = formValue.name.toString();
//   const docId = grade.concat('.').concat(name);
//
//   // check_class_is_already_on_collection
//   this._af.firestore.collection('class').doc(docId).get()
//     .then(docSnapshot => {
//       if (docSnapshot.exists) {
//         console.log('exists');
//       } else {
//         this._af.collection('class').doc(docId).set({
//           name,
//           createdAt: firebase.firestore.FieldValue.serverTimestamp(),
//           fees: formValue.fees,
//           type: formValue.type
//         }).catch((err) => console.log(err));
//       }
//     });
//
// }
//
// fetchClasses() {
//
//   this.classes = this._af.collection('class')
//     .valueChanges({idField: 'id'});
//
//   const nm = this.classes;
//
//   nm.subscribe((docs) => {
//     console.log(docs);
//
//     docs = docs.map((data) => {
//       const grade = data.id.toString().split('.')[0];
//       return {...data, grade};
//     }).map((doc) => {
//       const classFound = this.testClass.find(classes => classes['grade'] === doc.grade);
//       classFound ? classFound.name.push(doc) : this.testClass.push({grade: doc.grade, name: [doc]});
//     });
//     console.log(this.testClass);
//   });
// }

// eov_o1
//
// async submit() {
//   let number = 0;
//   const formValue = this.createClass.value;
//   console.log(formValue);
//   // await this._af.collection('class', ref => ref.where('grade', '==', formValue.grade.toString()))
//   //   .valueChanges()
//   //   .pipe(take(1))
//   //   .subscribe((docs) => {
//   //     // @ts-ignore
//   //     // docs.map((doc) => {
//   //     //   // @ts-ignore
//   //     //   console.log( doc.name.toLowerCase());
//   //     //   console.log(formValue.name.toLowerCase())
//   //     //   console.log(doc.name.toLowerCase() === formValue.name.toLowerCase())
//   //     //   if (doc.name.toLowerCase() === formValue.name.toLowerCase()) {
//   //     //     this._notification.ErrorMessage('class name already exists');
//   //     //   }
//   //     // });
//   //     console.log(docs)
//   //     number = Number(docs.reduce((max, p) => p.number > max ? p.number : max, 0)) + 1;
//   //     console.log(number);
//   //   });
//
//   const classdwef = this.classes = this._af.collection('class').valueChanges({idField: 'id'});
//   classdwef.subscribe(console.log)
//   // const docs = await this._af
//   //   .firestore
//   //   .collection('class')
//   //   // .where( formValue.grade.toString() , '==', '11')
//   //   .get();
//   //
//   // const number = (docs.docs.map(d => console.log(d.data())));
//   // console.log(number)
//   // @ts-ignore
//
//   // console.log(number)
//   //
//   // // crete_doc_id_format_'grade.number'
//   // const grade = formValue.grade.toString();
//   // const docId = grade.concat('.').concat(number);
//   // console.log(docId);
//   // check_class_is_already_on_collection
//   // this._af.firestore.collection('class').doc(docId).get()
//   //   .then(docSnapshot => {
//   //     if (docSnapshot.exists) {
//   //       console.log(docSnapshot.data());
//   //       console.log('exists');
//   //     } else {
//   //       this._af.collection('class').doc(docId).set({
//   //         name: formValue.name,
//   //         number,
//   //         grade: formValue.grade,
//   //         createdAt: firebase.firestore.FieldValue.serverTimestamp(),
//   //         fees: formValue.fees,
//   //         type: formValue.type
//   //       }).catch((err) => console.log(err));
//   //     }
//   //   });
//
// }
