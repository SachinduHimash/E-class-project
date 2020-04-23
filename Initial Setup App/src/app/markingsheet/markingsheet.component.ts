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
    if (localStorage.getItem('first') === '1' && localStorage.getItem('second') === '1') {
      this.getData();
    } else if (localStorage.getItem('first') === '1') {
      router.navigate(['paper']);
    } else {
      router.navigate(['']);
    }
   }

  ngOnInit(): void {
    this.myForm = this.fb.group({

    });
  }
  getData(){

  const retrivedToggle = localStorage.getItem('toggleKey');
  this.toggle = JSON.parse(retrivedToggle);

  const retrivedPaper = localStorage.getItem('paperKey');
  this.paper = JSON.parse(retrivedPaper);
  this.checkMarks();
  localStorage.removeItem('marksKey');

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
