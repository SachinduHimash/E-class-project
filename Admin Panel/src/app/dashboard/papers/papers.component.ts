import {Component, OnInit} from '@angular/core';

@Component({
  selector: 'app-papers',
  templateUrl: './papers.component.html',
  styleUrls: ['./papers.component.css']
})
export class PapersComponent implements OnInit {


  constructor() {
  }

  ngOnInit() {
  }
}


//
// import {Component, OnInit} from '@angular/core';
// import {FormArray, FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
// import {AngularFirestore} from '@angular/fire/firestore';
//
// import * as firebase from 'firebase';
// import 'firebase/firestore';
// import {MatDialog} from '@angular/material';
//
// import {UploaderComponent} from '../uploader/uploader.component';
//
// @Component({
//   selector: 'app-papers',
//   templateUrl: './papers.component.html',
//   styleUrls: ['./papers.component.css']
// })
// export class PapersComponent implements OnInit {
//
//   // create_form
//   formGroup: FormGroup;
//   form: FormArray;
//   updateFormGroup: FormGroup;
//   updateForm: FormArray;
//
//   // show_hide_update_form
//   showUpdateForm = false;
//
//   // show_hide_create_paper_stepper
//   showCreatePaper = false;
//
//   // dropdown_selector
//   correctAnswer = [
//     {
//       number: 1,
//       name: 'Answer 1'
//     },
//     {
//       number: 2,
//       name: 'Answer 2'
//     },
//     {
//       number: 3,
//       name: 'Answer 3'
//     },
//     {
//       number: 4,
//       name: 'Answer 4'
//     },
//   ];
//
//   constructor(private _fb: FormBuilder,
//               private _af: AngularFirestore,
//               public dialog: MatDialog) {
//   }
//
//   ngOnInit() {
//     this.buildForm();
//     this.buildUpdateForm();
//   }
//
//   // create__form
//   buildForm() {
//     this.formGroup = this._fb.group({
//       grade: new FormControl('', Validators.required),
//       paperNumber: new FormControl('', Validators.required),
//       form: this._fb.array([])
//     });
//     for (let i = 0; i < 20; i++) {
//       this.addItem(i + 1);
//     }
//   }
//
//   // initialize_sub_form
//   init(i) {
//     return this._fb.group({
//       number: new FormControl(i),
//       question: new FormControl('', []),
//       correctAnswer: new FormControl('', []),
//       answer1: new FormControl('', []),
//       answer2: new FormControl('', []),
//       answer3: new FormControl('', []),
//       answer4: new FormControl('', []),
//       picture: new FormControl('', []),
//     });
//   }
//
//   // add_new_sub_form_to_main_form
//   addItem(i) {
//     this.form = this.formGroup.get('form') as FormArray;
//     this.form.push(this.init(i));
//   }
//
//
//   formatPaperNumber = (paperNumber) => {
//     if (paperNumber < 10) {
//       paperNumber = '0'.concat(paperNumber.toString());
//     }
//     return paperNumber;
//   }
//
//   submit() {
//
//
//     // docRef_'papers/9/paperNumbers/202001
//     // tslint:disable-next-line:max-line-length
//     const docRef = `papers/${this.formGroup.value.grade}/paperNumbers/${new Date().getFullYear().toString().concat(this.formatPaperNumber(this.formGroup.value.paperNumber))}`;
//
//     // first_check_exist_of_paper
//     this._af
//       .firestore.doc(docRef).get().then(docSnapshot => {
//       if (docSnapshot.exists) {
//         console.log('paper already exists');
//       } else {
//         this._af.doc(docRef).set({
//           questions: this.form.value,
//           createdAt: firebase.firestore.FieldValue.serverTimestamp(),
//           updatedAt: null
//         })
//           .then(() => {
//             this.showCreatePaper = false;
//             this.formGroup.reset();
//             this.formGroup.clearValidators();
//           })
//           .catch(console.log);
//       }
//     });
//   }
//
//   showPaper() {
//
//     // docRef_'papers/9/paperNumbers/202001
//     // tslint:disable-next-line:max-line-length
//     const docRef = `papers/${this.formGroup.value.grade}/paperNumbers/${new Date().getFullYear().toString().concat(this.formatPaperNumber(this.formGroup.value.paperNumber))}`;
//     this._af.firestore
//       .doc(docRef)
//       .get()
//       .then(documentSnapshot => {
//         if (documentSnapshot.exists) {
//           console.log('document exists');
//         } else {
//           this.showCreatePaper = true;
//         }
//       });
//
//   }
//
//   openDialog(i) {
//
//     const dialogRef = this.dialog.open(UploaderComponent, {
//       width: '600px',
//       data: {
//         grade: this.formGroup.value.grade,
//         paperNumber: this.formGroup.value.paperNumber,
//         path: 'papers'
//       }
//     });
//
//     dialogRef.afterClosed().subscribe(result => {
//       (<FormArray>this.formGroup.controls['form']).at(i).patchValue({picture: result.url});
//     });
//   }
//
//
//   // Update_paper_section
//
//   buildUpdateForm() {
//     this.updateFormGroup = this._fb.group({
//       grade: new FormControl('', Validators.required),
//       paperNumber: new FormControl('', Validators.required),
//       form: this._fb.array([])
//     });
//   }
//
//   // get_old_paper_data_to_update
//   getOldPaper() {
//
//     const formValue = this.updateFormGroup.value;
//
//     // tslint:disable-next-line:max-line-length
//     const docPath = `papers/${formValue.grade}/paperNumbers/${(new Date().getFullYear()).toString().concat(this.formatPaperNumber(this.updateFormGroup.value.paperNumber))}`;
//
//     this._af.firestore
//       .doc(docPath)
//       .get()
//       .then(async (documentSnapshot) => {
//
//         if (documentSnapshot.exists) {
//           const docs = documentSnapshot.data();
//           console.log(docs);
//           this.updateForm = this.updateFormGroup.get('form') as FormArray;
//           // @ts-ignore
//           await docs.questions.map(doc => {
//             this.updateForm.push(this._fb.group({
//               number: new FormControl(doc.number || ''),
//               question: new FormControl(doc.question || '', []),
//               correctAnswer: new FormControl(doc.correctAnswer || '', []),
//               answer1: new FormControl(doc.answer1 || '', []),
//               answer2: new FormControl(doc.answer2 || '', []),
//               answer3: new FormControl(doc.answer3 || '', []),
//               answer4: new FormControl(doc.answer4 || '', []),
//               picture: new FormControl(doc.picture || '', []),
//             }));
//           });
//           console.log(this.updateFormGroup.value);
//           this.showUpdateForm = true;
//         } else {
//           console.log('paper not found');
//         }
//       });
//
//
//   }
//
//   openUpdateDialog(i) {
//
//     const dialogRef = this.dialog.open(UploaderComponent, {
//       width: '600px',
//       data: {
//         grade: this.updateFormGroup.value.grade,
//         paperNumber: this.updateFormGroup.value.paperNumber,
//         path: 'papers'
//       }
//     });
//
//     dialogRef.afterClosed().subscribe(result => {
//       (<FormArray>this.updateFormGroup.controls['form']).at(i).patchValue({picture: result.url});
//     });
//   }
//
//   submitUpdateForm() {
//     console.log(this.updateFormGroup.value);
//     // tslint:disable-next-line:max-line-length
//     const docRef = `papers/${this.updateFormGroup.value.grade}/paperNumbers/${new Date().getFullYear().toString().concat(this.formatPaperNumber(this.updateFormGroup.value.paperNumber))}`;
//     this._af.doc(docRef).set({
//       questions: this.updateFormGroup.value.form,
//       updatedAt: firebase.firestore.FieldValue.serverTimestamp(),
//     }, {merge: true})
//       .then(() => {
//         this.showUpdateForm = false;
//         this.updateFormGroup.reset();
//         this.updateFormGroup.clearValidators();
//       })
//       .catch(console.log);
//
//   }
//
//
// }
