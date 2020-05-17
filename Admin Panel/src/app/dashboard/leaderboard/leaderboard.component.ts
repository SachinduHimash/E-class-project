import {Component, OnInit, ViewChild} from '@angular/core';
import {AngularFirestore} from '@angular/fire/firestore';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {MathsService} from '../services/maths.service';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
@Component({
  selector: 'app-leaderboard',
  templateUrl: './leaderboard.component.html',
  styleUrls: ['./leaderboard.component.css']
})
export class LeaderboardComponent implements OnInit {


  viewRank: FormGroup;
  showViewForm = false;
  students;

  // table
  displayedColumns = ['rank', 'displayName' , 'mark'];
  dataSource: MatTableDataSource<any>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              private _math: MathsService) {
  }

  ngOnInit(): void {
    this.buildViewForm();
  }

  formatPaperNumber = (paperNumber) => {
    if (paperNumber < 10) {
      paperNumber = '0'.concat(paperNumber.toString());
    }
    return paperNumber;
  }

  applyFilter(filterValue: string) {
    filterValue = filterValue.trim();
    filterValue = filterValue.toLowerCase();
    this.dataSource.filter = filterValue;
  }

  buildViewForm() {
    this.viewRank = this._fb.group({
      grade: new FormControl('', Validators.required),
      paperNumber: new FormControl('', Validators.required),
    });
  }

  Ranking(students) {
    let rank = 1;
    let skipper = 0;
      students[0].rank = 1;
      students[0].displayName = students[0].name;
    for (let i = 1; i < students.length; i++) {
      skipper++;
      if (students[i - 1].mark === students[i].mark) {
        rank <= 10 ? students[i].displayName = students[i].name : students[i].displayName = students[i].id;
        students[i].rank = rank;
      } else {
        rank += skipper;
        rank <= 10 ? students[i].displayName = students[i].name : students[i].displayName = students[i].id;
        students[i].rank = rank;
        skipper = 0;
      }
      console.log(students[i].rank);
    }
    this.students = students;

    this.dataSource = new MatTableDataSource(this.students);
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;

    return students;
  }
  getstudents() {

    const formValue = this.viewRank.value;

    // tslint:disable-next-line:max-line-length
    const collectionPath = `marks/${formValue.grade}/paperNumbers/${(new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(this.viewRank.value.paperNumber))}/students`;
    this._af.collection(collectionPath, ref => ref.orderBy('mark', 'desc'))
      .valueChanges({ idField: 'id'})
      .subscribe(async (doc) => {
        this.students = await this.Ranking(doc);
        console.log(this.students.length);
        this.showViewForm = true;
      });
  }

}
