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

  //correct answer array,choices array and marks array

  correctansArray:Number[]=[];
  choiceArray:Number[]=[];
  marksArray:Number[]=[];

 //toggles to color buttons

  toggle:any []= [true,true,true,true];
  status:any[] = ['Enable','Enable','Enable','Enable'];
  

  // create_form
  updateFormGroup: FormGroup;

  // show_hide_update_form
  showViewForm = false;

  // fetched_paper_data;
  paper;

  //submitting the paper
  submitted=false;

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              private _math: MathsService,
              private router: Router) {
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

  // get_old_paper_data
  getPaper() {

    const formValue = this.updateFormGroup.value;

    // tslint:disable-next-line:max-line-length
    const docPath = `papers/${formValue.grade}/paperNumbers/${(new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(this.updateFormGroup.value.paperNumber))}`;

    this._af.doc(docPath)
      .valueChanges()
      .subscribe( (doc: Papers) => {
        this.paper =  doc.questions;
        console.log(this.paper)
        console.log(doc.createdAt)
        console.log(doc.updatedAt)
        this.showViewForm = true;
      });

    this._af.doc(docPath).valueChanges().subscribe(console.log);

    for (let i in this.paper) {
      this.correctansArray[i]=this.paper[i].correctAnswer;
    }
    console.log(this.correctansArray);
  }

  //checking answers

  checkAnswer(question:number,choice:number){

    var EnabledAnswer; 
    this.toggle[choice-1] = !this.toggle[choice-1];
    this.status[choice-1] = this.toggle[choice-1] ? 'Enable' : 'Disable';
    console.log(this.status);

    for(let i in this.status){
      if(this.status[i]=='Disable'){
        EnabledAnswer=i;
        EnabledAnswer++;
      }
    }

    this.choiceArray[question-1]=EnabledAnswer;
    console.log('My answers are'+this.choiceArray)

  }
  
 //submit

  submit(){
    this.submitted=!this.submitted;
  }
  submit2(markingsheet:String){


    for(let i in this.correctansArray){
      if(this.correctansArray[i]==this.choiceArray[i]){
        this.marksArray[i]=1;
      }else{
        this.marksArray[i]=0;
      }
    }

    this.router.navigate([`${markingsheet}`]);

    localStorage.setItem("paperKey",JSON.stringify(this.paper));
    localStorage.setItem("toggleKey",JSON.stringify(this.toggle));
    localStorage.setItem("marksKey",JSON.stringify(this.marksArray));
  }
}
