import {Component, OnInit} from '@angular/core';
import {AngularFirestore} from '@angular/fire/firestore';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';

import * as firebase from 'firebase';

@Component({
  selector: 'app-students',
  templateUrl: './students.component.html',
  styleUrls: ['./students.component.css']
})
export class StudentsComponent implements OnInit {

  // forms
  createClass: FormGroup;
  createStudent: FormGroup;
  // class_type
  classTypes: any[] = [];

  // list_of_student
  student: any;

  // show_hide_add_class
  addStudentShow = false;
  buttonText = 'Insert student';


  passwordType = 'password';

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore) {
  }

  ngOnInit(): void {
    this.fetchStudent();
    this.fetchClasses();
    this.buildCreateClass();
    this.buildCreateStudent();
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

  buildCreateStudent() {
    this.createStudent = this._fb.group({
        name: new FormControl('', Validators.required),
        address: new FormControl('', Validators.required),
        telephone: new FormControl('', Validators.required),
        email: new FormControl('', Validators.email),
        class: new FormControl('', Validators.required),
        password: new FormControl('', Validators.required),
      },
    );
  }

  submit() {

    const formValue = this.createStudent.value;
    console.log(formValue);
    // generate document id 'Year'_'class_name'_'student_name'_'random_number'
    const docId = (new Date().getFullYear()).toString()
      .concat('.').concat(formValue.class.value.trim())
      .concat('.').concat(formValue.name.trim())
      .concat('.').concat(Math.ceil(Math.random() * (Math.pow(10, 9))).toString());

    console.log(docId);

    // this._af.collection('users')
    //         .doc(docId)
    //         .set();
  }

  fetchStudent() {

    this.student = this.student = this._af.collection('users', ref => ref.where('role', '==', 'student'))
      .valueChanges({idField: 'id'});
    // .subscribe(docs => {
    //   docs.forEach((d) => console.log(d.class));
    // docs = docs.map((data) => {
    //   const grade = data.id.toString().split('.')[0];
    //   return {...data, grade};
    // }).map((doc) => {
    //   const classFound = this.testClass.find(student => student['grade'] === doc.grade);
    //   classFound ? classFound.name.push(doc) : this.testClass.push({grade: doc.grade, name: [doc]});
    // });

    //  tc
    // console.log(this.testClass);
    // });

  }

  fetchClasses() {
    this._af.collection('class')
      .valueChanges({idField: 'id'})
      .subscribe(docs => {
        this.classTypes = docs.map((data) => {
          const grade = data.id.toString().split('.')[0];
          let name = '';
          data?.name ? name = grade.concat(' - ').concat(data?.name) : name = grade;
          return {name, value: data.id, grade};
        });
      });
  }

  // change_password_input_field_type
  showPassword() {
    this.passwordType === 'text' ? this.passwordType = 'password' : this.passwordType = 'text';
  }

  // show_hide_add_class_content
  showAddStudent() {
    this.addStudentShow ? this.buttonText = 'Insert student' : this.buttonText = 'Hide form';
    this.addStudentShow = !this.addStudentShow;

  }
}
