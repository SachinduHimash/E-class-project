import { Component, OnInit, Input } from '@angular/core';
import { ReactiveFormsModule, FormControl, FormsModule, FormBuilder, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';


@Component({
  selector: 'app-markingsheet',
  templateUrl: './markingsheet.component.html',
  styleUrls: ['./markingsheet.component.css']
})
export class MarkingsheetComponent implements OnInit {

  myForm: FormGroup;
  showViewForm = true;
  toggle;
  paper;
  marks = 0;


  constructor(private fb: FormBuilder, private router: Router,) {
    if (!localStorage.getItem('userID')) {
      router.navigate(['']);
    }
    this.getData();

   }

  ngOnInit(): void {
    this.myForm = this.fb.group({

    });
  }
  home(){
    this.router.navigate(['home']);
  }
  getData(){

    const retrivedToggle = localStorage.getItem('toggleKey');
    this.toggle = JSON.parse(retrivedToggle);

    const retrivedPaper = localStorage.getItem('paperKey');
    this.paper = JSON.parse(retrivedPaper);
    this.checkMarks();

  }

  isMobileMenu() {
    if (screen.width > 991) {
      return false;
    }
    return true;
  }

  checkMarks(){
    for (let index = 0; index < this.toggle.length; index++) {
      if (this.toggle[index] === this.paper[index].correctAnswer){
        this.marks += 5;
      }
    }
  }

}
