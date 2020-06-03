import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators, FormBuilder } from '@angular/forms';
import { AngularFirestore } from '@angular/fire/firestore/firestore';
import { DatePipe } from '@angular/common';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
 

  myform: FormGroup;
  showDetails=true;

  constructor(
    private fb: FormBuilder,
    public af: AngularFirestore,
    private datePipe: DatePipe,
    public dialog: MatDialog,
    private router: Router,
    
  ) { }

  ngOnInit(): void {
    this.myform = this.fb.group({
      userID: new FormControl('', Validators.required),
      password: new FormControl('', [Validators.required, Validators.minLength(8)]),
  
    }, { validator: this.checkPasswords });
    
    }

    checkPasswords(group: FormGroup){
      
    }

    submit(){

    }
  }


