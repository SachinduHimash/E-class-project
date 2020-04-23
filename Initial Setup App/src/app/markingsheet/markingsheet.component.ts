import { Component, OnInit, Input } from '@angular/core';
import { ReactiveFormsModule, FormControl, FormsModule, FormBuilder, FormGroup } from '@angular/forms';


@Component({
  selector: 'app-markingsheet',
  templateUrl: './markingsheet.component.html',
  styleUrls: ['./markingsheet.component.css']
})
export class MarkingsheetComponent implements OnInit {
  
  myForm:FormGroup;
  showViewForm=true;
  toggle;
  paper;
  marks;
   

  constructor(private fb: FormBuilder) {
    this.getData();
   }

  ngOnInit(): void {
    this.myForm=this.fb.group({

    });
  }
  getData(){

  var retrivedToggle=localStorage.getItem("toggleKey");
  this.toggle=JSON.parse(retrivedToggle);
   
  var retrivedPaper=localStorage.getItem("paperKey");
  this.paper=JSON.parse(retrivedPaper);

  var retrivedMarks=localStorage.getItem("marksKey");
  this.marks=JSON.parse(retrivedMarks);

  console.log(this.toggle);
  console.log(this.paper);
   
  }

}
