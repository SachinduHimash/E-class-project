import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { FormGroup,FormBuilder,FormControl,Validators} from '@angular/forms';
import { AngularFireDatabase} from '@angular/fire/database'
import {AngularFirestore} from '@angular/fire/firestore';



@Component({
  selector: 'app-setupform',
  templateUrl: './setupform.component.html',
  styleUrls: ['./setupform.component.css']
})
export class SetupformComponent implements OnInit {

  myform:FormGroup;
  classes:any[]=[
    'Warana Mass Class', 
    'Warana Group Class', 
    'Warana Paper Class Only', 
    'Sadhana Mass Class',
    'Sadhana Group Class',
    'Sadhana Paper Class Only',
    'Susipka Mass Class',
    'Susipka Group Class',
    'Susipka Paper Class Only'
  ];
  
  choice;
  

  constructor(
    private fb: FormBuilder,
    public db:AngularFirestore
  ) { }

  ngOnInit() {
    this.myform=this.fb.group({
      
      userID: new FormControl('', Validators.required),
      fullName: new FormControl('', Validators.required),
      school: new FormControl('', Validators.required),
      address: new FormControl('', Validators.required),
      grade: new FormControl('', Validators.required),
      teleNo: new FormControl('', [Validators.required,Validators.minLength(10)]),
      class: new FormControl('', Validators.required),

    })
    this.myform.valueChanges.subscribe(console.log)
    }

  
  
   submit(){
     const formValue=this.myform.value;
     console.log(formValue);
     const userID=formValue.userID;
     
    //Getting the class
     
    switch(formValue.class){
      case 'Warana Mass Class':
        this.choice=1;
        console.log(this.choice);
        break;
      case 'Warana Group Class':
        this.choice=2;
        console.log(this.choice);
        break;
      case 'Warana Paper Class Only':
        this.choice=3;
        console.log(this.choice);
        break;
      case 'Sadhana Mass Class':
       this.choice=4;
        console.log(this.choice);
        break;
      case 'Sadhana Group Class':
        this.choice=5;
        console.log(this.choice);
        break;
      case 'Sadhana Paper Class Only':
        this.choice=6;
        console.log(this.choice);
        break; 
      case 'Susipka Mass Class':
        this.choice=7;
        console.log(this.choice);
        break; 
      case 'Susipka Group Class':
        this.choice=8;
        console.log(this.choice);
        break;
      case 'Susipka Paper Class Only':
        this.choice=9;
        console.log(this.choice);
        break;
     }


     const newClass=(formValue.grade.toString()).concat(".").concat(this.choice);

     this.db.doc(`users/${userID}`)
     .set({
       fullName:formValue.fullName,
       school:formValue.school,
       address:formValue.address,
       teleNo:formValue.teleNo,
       class: newClass,
       //password: btoa(formValue.password),
       role: 'student'
     }).then(() => {
     this.db.doc(`class/${formValue.class.value}/students/${userID}`)
       .set({
         fullName: formValue.fullName,
         address: formValue.address,
         
       }).then(() => {
       console.log('submitted');
     }).catch(console.log);
   }).catch(console.log);
   console.log('end')
   }

    
    

}