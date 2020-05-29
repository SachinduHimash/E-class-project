import {Component, OnInit, ViewChild} from '@angular/core';
import {AngularFirestore} from '@angular/fire/firestore';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {MathsService} from '../services/maths.service';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import {NotificationService} from '../services/notification.service';
import {RankingService} from '../services/ranking.service';
import {Route, Router} from "@angular/router";

@Component({
  selector: 'app-leaderboard',
  templateUrl: './leaderboard.component.html',
  styleUrls: ['./leaderboard.component.css']
})
export class LeaderboardComponent implements OnInit {


  viewRank: FormGroup;
  showViewTop10 = false;
  showViewForm = false;
  progress = false;
  students;

  // table
  displayedColumns = ['rank', 'displayName', 'mark'];



  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              private _math: MathsService,
              private _ranking: RankingService,
              private _notification: NotificationService,
              private _router: Router) {
  }

  ngOnInit(): void {
    this.buildViewForm();
  }


  buildViewForm() {
    this.viewRank = this._fb.group({
      grade: new FormControl('', Validators.required),
      paperNumber: new FormControl('', Validators.required),
    });
  }


  async getRanking() {

    try {
      const grade = this.viewRank.value.grade;
      const paperNumber = this.viewRank.value.paperNumber;

      this.students = await this._ranking.getStudent(grade, paperNumber);

      this.showViewForm = true;
    } catch (e) {
      if (e.err) {
        this._notification.ErrorMessage(e.err);
      }
      return;
    }


  }

  async viewTop10(){
    try {
      const grade = this.viewRank.value.grade;
      const paperNumber = this.viewRank.value.paperNumber;

      this.students = await this._ranking.getStudent(grade, paperNumber);

      this.showViewTop10 = true;
    } catch (e) {
      if (e.err) {
        this._notification.ErrorMessage(e.err);
      }
      return;
    }
  }

  async generateRanking() {

    try {
      this.progress = true;
      const grade = this.viewRank.value.grade;
      const paperNumber = this.viewRank.value.paperNumber;

      await this._ranking.generateRanking(grade, paperNumber);
      this._notification.ErrorMessage('generate ranked successfully');
      this.progress = false;
    } catch (e) {
      if (e.err) {
        this.progress = false;
        this._notification.ErrorMessage(e.err);
      }
      return;
    }


  }

  reRoute() {
      this._router.navigateByUrl('/leaderboard')
  }

  closeWindow() {
    this.showViewTop10 = false;
    this.showViewForm = false;

  }
}

