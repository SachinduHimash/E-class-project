import {AfterViewInit, Component, Input, OnDestroy , OnInit, ViewChild} from '@angular/core';
import {AngularFirestore} from '@angular/fire/firestore';

import {Class} from '../../interfaces/databaseInterfaces';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import {Subscription} from 'rxjs';

@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.css']
})
export class StudentListComponent implements OnInit, AfterViewInit , OnDestroy{

  // list_of_student
  @Input() student = [];

  // table
  displayedColumns = ['uid', 'fullName', 'className'];
  dataSource: MatTableDataSource<any>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
  private classSubscribe: Subscription;
  private studentSubscribe: Subscription;


  constructor(private _af: AngularFirestore) {
  }

  ngOnInit(): void {
    this.fetchStudentData();
  }

  ngAfterViewInit() {
  }

  ngOnDestroy() {
    this.classSubscribe.unsubscribe();
    this.studentSubscribe.unsubscribe();
  }

  applyFilter(filterValue: string) {
    filterValue = filterValue.trim();
    filterValue = filterValue.toLowerCase();
    this.dataSource.filter = filterValue;
  }

  fetchStudentData() {
    this.classSubscribe = this._af.collection('class', ref => ref.where('grade', '==', 11))
      .valueChanges()
      .subscribe((docs) => {
        docs = docs.map((doc: Class) => {

          const grade = doc.grade.toString().concat('.').concat(doc.number.toString());

          this.studentSubscribe = this._af.collection(`class/${grade}/students`)
            .valueChanges({idField: 'uid'})
            .subscribe(results => {
              results.map((resultDoc) => {
                this.student.push({
                  uid: resultDoc.uid,
                  // @ts-ignore
                  fullName: resultDoc.fullName,
                  // grade: doc.grade.toString().concat(doc.number.toString()),
                  className: doc.name,
                  classType: doc.type
                });
              });
              this.dataSource = new MatTableDataSource(this.student);
              this.dataSource.paginator = this.paginator;
              this.dataSource.sort = this.sort;
            });
        });

      });
  }


  getRecord(row: any) {
    console.table(row)
  }
}


