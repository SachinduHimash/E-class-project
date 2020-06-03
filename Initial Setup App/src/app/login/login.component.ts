import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators, FormBuilder } from '@angular/forms';
import { AngularFirestore } from '@angular/fire/firestore';
import { DatePipe } from '@angular/common';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import {Md5} from 'ts-md5';
import { DialogboxComponent } from '../dialogbox/dialogbox.component';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
 

  myform: FormGroup;
  showDetails=true;
  correctPass;
  pass;
  isPaper;

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
  
    }, );
    
    }

    submit(value){
      this.af.collection('users').doc(value.userID).valueChanges().subscribe((doc) => {
        localStorage.setItem('grade', doc['class'].split('.')[0]);
        this.correctPass=doc['password'];
        this.pass= Md5.hashStr(value.password);

       if(this.pass==this.correctPass){
        this.isPaper = true;
        localStorage.setItem('onKey', JSON.stringify(this.isPaper));
        localStorage.setItem('first', '1');
          this.dialog.open(DialogboxComponent);
       }
        
      });
    }
 }
  


