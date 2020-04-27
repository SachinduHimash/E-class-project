import {Component, OnInit, AfterViewInit, ViewChild, Input, SimpleChanges, OnChanges} from '@angular/core';
import {AngularFirestore, AngularFirestoreCollection} from '@angular/fire/firestore';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import {Observable} from 'rxjs';

import {AuthenticationService} from '../../services/authentication.service';

@Component({
  selector: 'app-view-class',
  templateUrl: './view-class.component.html',
  styleUrls: ['./view-class.component.css']
})
export class ViewClassComponent implements OnInit, AfterViewInit, OnChanges {

  @Input() classNumber: string;

  // classNumber = '11.1';
  // table_column
  displayedColumns = ['Id', 'fullName'];
  dataSource: MatTableDataSource<any>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  // class_BasicData
  classData: Observable<unknown>;
  totalStudent: Number;


  constructor(private _af: AngularFirestore,
              private _authService: AuthenticationService) {
  }

  ngAfterViewInit() {
    this.fetchClassStudent();
  }

  ngOnInit(): void {
    this.fetchClassData();
    console.log(this.classNumber);
  }

  ngOnChanges(changes: SimpleChanges) {
    if (changes.classNumber.currentValue !== changes.classNumber.previousValue) {
      this.classNumber = changes.classNumber.currentValue;
      this.fetchClassStudent();
      this.fetchClassData();
    }
  }

  applyFilter(filterValue: string) {
    filterValue = filterValue.trim();
    filterValue = filterValue.toLowerCase();
    this.dataSource.filter = filterValue;
  }

  fetchClassData() {
    this.classData = this._af.collection('class').doc(this.classNumber).valueChanges();
  }

  fetchClassStudent() {
    this._af.collection(`class/${this.classNumber}/students`)
      .valueChanges({idField: 'Id'})
      .subscribe((docs) => {
        this.totalStudent = docs.length;
        this.dataSource = new MatTableDataSource(docs);
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      });
  }

}
