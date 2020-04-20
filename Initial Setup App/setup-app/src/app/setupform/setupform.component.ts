import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { FormGroup,FormBuilder,FormControl,Validators} from '@angular/forms';


@Component({
  selector: 'app-setupform',
  templateUrl: './setupform.component.html',
  styleUrls: ['./setupform.component.css']
})
export class SetupformComponent implements OnInit {
  myform:FormGroup;
  
  
  

  constructor(
    private fb: FormBuilder
  ) { }

  ngOnInit() {
    this.myform=this.fb.group({
      userID:'',
      fullName:'',
      school:'',
      grade:'',
      class:'',
      address:'',
      teleNo:''

    })
    this.myform.valueChanges.subscribe(console.log)
    }

  
  
  

    
    

}