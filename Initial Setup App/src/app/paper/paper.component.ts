import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {AngularFirestore} from '@angular/fire/firestore';
import { Router } from '@angular/router';

// typeDefinition
import {Papers} from '../interfaces/databaseInterfaces';

import {MathsService} from '../maths.service';

@Component({
  selector: 'app-paper',
  templateUrl: './paper.component.html',
  styleUrls: ['./paper.component.css']
})


export class PaperComponent implements OnInit {

  // correct answer array,choices array and marks array

  correctansArray: Number[] = [];
  choiceArray: Number[] = [];
  marksArray: Number[] = [];

 // toggles to color buttons

  toggle: any[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];


  // create_form
  updateFormGroup: FormGroup;
  // fetched_paper_data;
  paper;

  //submitting the paper
  submitted = false;

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              private _math: MathsService,
              private router: Router) {
    if (localStorage.getItem('first') === '1' && localStorage.getItem('second') === '1') {
      router.navigate(['markingsheet']);
    } else if (localStorage.getItem('first') === '1') {
      this.getPaper();
    } else {
      router.navigate(['']);
    }

  }

  ngOnInit() {
    this.buildViewForm();
  }


  formatPaperNumber = (paperNumber) => {
    if (paperNumber < 10) {
      paperNumber = '0'.concat(paperNumber.toString());
    }
    return paperNumber;
  };

  // Update_paper_section
  buildViewForm() {
    this.updateFormGroup = this._fb.group({
      grade: new FormControl('', Validators.required),
      paperNumber: new FormControl('', Validators.required),
    });
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
        console.log(this.paper);
        console.log(doc.createdAt);
        console.log(doc.updatedAt);
      });

    this._af.doc(docPath).valueChanges().subscribe(console.log);

    for (let i in this.paper) {
      this.correctansArray[i] = this.paper[i].correctAnswer;
    }
    console.log(this.correctansArray);
  }

  // checking answers

  checkAnswer(question: number, choice: number){

    this.toggle[question - 1] = choice;

  }

  // submit

  submit(){
    this.submitted = !this.submitted;
  }
  // tslint:disable-next-line: ban-types
  submit2(markingsheet: String){

    localStorage.setItem('paperKey', JSON.stringify(this.paper));
    localStorage.setItem('toggleKey', JSON.stringify(this.toggle));
    localStorage.setItem('second', '1');

    this.router.navigate([`${markingsheet}`]);

  }
}
