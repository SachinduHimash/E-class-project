import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { AngularFirestore } from '@angular/fire/firestore';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';

@Component({
  selector: 'app-rank',
  templateUrl: './rank.component.html',
  styleUrls: ['./rank.component.css']
})
export class RankComponent implements OnInit {
  displayedColumns = ['rank', 'mark','id', 'fullName', 'school', 'class'];
  dataSource: MatTableDataSource<any>;

  displayedColumns1 = ['rank', 'mark', 'fullName'];
  dataSource1: MatTableDataSource<any>;
  userID;

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  classes: any[] =
    [
      {
        grade: 11,
        class: 'Warana Group Class',
        number: 2,
        type: 'Group'

      },
      {
        grade: 11,
        class: 'Warana Paper Class Only',
        number: 3,
        type: 'Paper'

      },
      {
        grade: 11,
        class: 'Sadhana Mass Class',
        number: 4,
        type: 'Mass'

      },
      {
        grade: 11,
        class: 'Sadhana Group Class',
        number: 5,
        type: 'Group'

      },
      {
        grade: 11,
        class: 'Sadhana Paper Class Only',
        number: 6,
        type: 'Paper'

      },
      {
        grade: 11,
        class: 'Susipka Mass Class',
        number: 7,

      },
      {
        grade: 11,
        class: 'Susipka Group Class',
        number: 8,
        type: 'Group'

      },
      {
        grade: 11,
        class: 'Susipka Paper Class Only',
        number: 9,
        type: 'Paper'

      },
      {
        grade: 10,
        class: 'Warana Class',
        number: 10,
        type: 'Mass'

      },
      {
        grade: 10,
        class: 'Sadhana Class',
        number: 11,
        type: 'Mass'

      },
      {
        grade: 10,
        class: 'Susipka Class',
        number: 12,
        type: 'Mass'

      },
      {
        grade: 9,
        class: 'Warana Class',
        number: 13,
        type: 'Mass'

      },
      {
        grade: 9,
        class: 'Sadhana Mass Class',
        number: 14,
        type: 'Mass'

      },
      {
        grade: 9,
        class: 'Susipka Class',
        number: 15,
        type: 'Mass'

      },
    ];


  constructor(private router: Router, private _af: AngularFirestore, ) {
    if (!localStorage.getItem('userID')) {
      router.navigate(['']);
    }
    this.userID = localStorage.getItem('userID');
   }

  ngOnInit(): void {
    this._af.collection('ranking').doc(localStorage.getItem('grade')).collection('rank', ref => ref.orderBy('createdAt', 'desc').limit(1))
      .valueChanges({ idField: 'paperNumber' })
      .subscribe((doc) => {
        let data = doc[0].rank;
        let data1 = doc[0].rank;
        data.forEach(element => {
          if (element.class) {
          element.class = this.getclass(element.class);
          }
        });
        data1.forEach(element => {
          if (element.rank > 10){
            element.name = element.id;
          }
          // if (element.class) {
          //   element.class = this.getclass(element.class);
          // }
        });
        this.dataSource = new MatTableDataSource(data);
        this.dataSource1 = new MatTableDataSource(data1);
      });

  }
  home() {
    this.router.navigate(['home']);
  }

  getclass(x){
    const grade = x.split('.')[0];
    const classn = +x.split('.')[1];

    return this.classes[classn - 2].class;

  }

  ismobile() {
    if (screen.width > 991) {
      return false;
    }
    return true;
  }

}
