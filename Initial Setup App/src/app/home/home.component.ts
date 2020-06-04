import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  constructor(private router: Router,) { }

  ngOnInit(): void {
  }

  attempt(){
    if (localStorage.getItem('paperKey') != null){
      return true;
    }
    return false;

  }

  paper(){
    this.router.navigate(['paper']);
  }

  rank(){
    this.router.navigate(['rank']);
  }

  marking(){
    this.router.navigate(['markingsheet']);
  }

  ismobile() {
    if (screen.width > 764) {
      return false;
    }
    return true;
  }

}
