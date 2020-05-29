import {
  AfterViewInit,
  Component,
  EventEmitter,
  Input,
  Output,
  OnChanges,
  OnInit,
  SimpleChanges,
  ViewChild
} from '@angular/core';
import {AngularFirestore} from '@angular/fire/firestore';
import {MatDialog, MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import {Observable} from 'rxjs';

import {AuthenticationService} from '../../services/authentication.service';
import {ReportComponent} from '../report/report.component';

import {User} from '../../interfaces/databaseInterfaces';

@Component({
  selector: 'app-view-class',
  templateUrl: './view-class.component.html',
  styleUrls: ['./view-class.component.css']
})
export class ViewClassComponent implements OnInit, AfterViewInit, OnChanges {

  @Input() classNumber: string;
  @Output() updateClassDetails = new EventEmitter<string>();
  // classNumber = '11.1';
  // table_column
  displayedColumns = ['id', 'fullName'];
  dataSource: MatTableDataSource<any>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  // class_BasicData
  classData: Observable<unknown>;
  totalStudent: Number;

  constructor(private _af: AngularFirestore,
              private _authService: AuthenticationService,
              public dialog: MatDialog) {
  }

  ngAfterViewInit() {
    this.fetchClassStudent();
  }

  ngOnInit(): void {
    this.fetchClassData();
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
      .valueChanges({idField: 'id'})
      .subscribe((docs) => {
        const grade = this.classNumber;
        docs = docs.map((r: User) => {
          return {...r, grade};
        });

        this.totalStudent = docs.length;
        this.dataSource = new MatTableDataSource(docs);
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      });
  }

  getRecords(row: any) {
    // console.log(row);
    this.dialog.open(ReportComponent, {
      width: '600px',
      data: row
    });
  }

  updateClass(classData) {
    this.updateClassDetails.emit(classData);
  }
}
