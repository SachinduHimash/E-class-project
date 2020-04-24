import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { Router } from '@angular/router';


@Component({
  selector: 'app-dialogbox',
  templateUrl: './dialogbox.component.html',
  styleUrls: ['./dialogbox.component.css']
})
export class DialogboxComponent implements OnInit {


  isPaper;
  constructor(private router: Router
     ) { 
       this.getData();
     }

  ngOnInit(): void {
  }
  viewPaper(paper:string): void {
    this.router.navigate([`${paper}`]);
   
  }
  getData(){
    const retrivedPaper = localStorage.getItem('onKey');
    this.isPaper = JSON.parse(retrivedPaper);
    
  }
}
