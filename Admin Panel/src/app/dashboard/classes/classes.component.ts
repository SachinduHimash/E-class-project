import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {AngularFirestore} from '@angular/fire/firestore';

// use_for_timestamp
import * as firebase from 'firebase';
import 'firebase/firestore';

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
    'Group Class',
    'Master Class',
    'Special Group Class',
    'Individual',
    'Other'
  ];

  // list_of_classes
  classes: any;
  testClass: any[] = [];

  // show_hide_add_class
  addClassShow = false;
  buttonText = 'Insert class';

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore) {
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

  submit() {

    const formValue = this.createClass.value;

    // crete_doc_id_format_'grade.name'
    const grade = formValue.grade.toString();
    const name = formValue.name.toString();
    const docId = grade.concat('.').concat(name);

    // check_class_is_already_on_collection
    this._af.firestore.collection('class').doc(docId).get()
      .then(docSnapshot => {
        if (docSnapshot.exists) {
          console.log('exists');
        } else {
          this._af.collection('class').doc(docId).set({
            name,
            createdAt: firebase.firestore.FieldValue.serverTimestamp(),
            fees: formValue.fees,
            type: formValue.type
          }).catch((err) => console.log(err));
        }
      });

  }

  fetchClasses() {

    this.classes = this._af.collection('class')
      .valueChanges({idField: 'id'});

    const nm = this.classes;

    nm.subscribe((docs) => {
      console.log(docs);

      docs = docs.map((data) => {
        const grade = data.id.toString().split('.')[0];
        return {...data, grade};
      }).map((doc) => {
        const classFound = this.testClass.find(classes => classes['grade'] === doc.grade);
        classFound ? classFound.name.push(doc) : this.testClass.push({grade: doc.grade, name: [doc]});
      });
      console.log(this.testClass);
    });
  }

  // show_hide_add_class_content
  showAddClass() {
    this.addClassShow ? this.buttonText = 'Insert class' : this.buttonText = 'Hide form';
    this.addClassShow = !this.addClassShow;

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
