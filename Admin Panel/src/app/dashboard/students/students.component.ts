import {Component, Input, OnDestroy, OnInit, ViewChild} from '@angular/core';
import {AngularFirestore} from '@angular/fire/firestore';
// type_definition
import {Class} from '../interfaces/databaseInterfaces';
// authentication_service_for_hashing password
import 'firebase/firestore';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import {Subscription} from 'rxjs';
import {environment} from '../../../environments/environment';

import algoliaSearch from 'algoliasearch/lite';
import {NotificationService} from '../services/notification.service';

@Component({
  selector: 'app-students',
  templateUrl: './students.component.html',
  styleUrls: ['./students.component.css']
})
export class StudentsComponent implements OnInit, OnDestroy {


  algoliaConfig = {
    indexName: environment.algolia.indexName,
    searchClient: algoliaSearch(environment.algolia.appId, environment.algolia.apiKey),
    insightsClient: (window as any).aa,
  };
  // show_hide_add_class
  addStudentShow = false;
  updateStudentShow = false;
  buttonText = 'Insert student';
  showDataTables = true;
  // list_of_student
  @Input() student = [];
  gradeSelected = 10;
  previousGrade = 10;
  // table
  displayedColumns = ['uid', 'fullName', 'className', 'update', 'view', 'delete'];
  dataSource: MatTableDataSource<any>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
  studentIdReportCard: any;
  studentDetails: any;

  private classSubscribe: Subscription;
  private studentSubscribe: Subscription;
  private search: any;

  constructor(private _af: AngularFirestore,
              private _notification: NotificationService) {
  }

  ngOnInit(): void {
    this.fetchStudentData();

  }


  ngOnDestroy() {
    // this.classSubscribe.unsubscribe();
    // this.studentSubscribe.unsubscribe();
  }

  applyFilter(filterValue) {
    filterValue = filterValue.trim();
    filterValue = filterValue.toLowerCase();
    this.dataSource.filter = filterValue;
  }

  async fetchStudentData(grade = 10) {


    this.classSubscribe = await this._af.collection('class', ref => ref.where('grade', '==', grade))
      .valueChanges()
      .subscribe(async (docs) => {
        // console.log(docs.length)
        if(docs.length <= 0){
          this._notification.ErrorMessage(`No students found for grade ${grade}`);
          this.dataSource = new MatTableDataSource([]);
          this.dataSource.paginator = this.paginator;
          this.dataSource.sort = this.sort;
          return;
        }

        this.student = [];
        docs = await docs.map((doc: Class) => {

          const grade = doc.grade.toString().concat('.').concat(doc.number.toString());

          this.studentSubscribe = this._af.collection(`class/${grade}/students`)
            .valueChanges({idField: 'uid'})
            .subscribe(results => {
              results.map((resultDoc) => {
                // @ts-ignore
                this.student.push({
                  uid: resultDoc.uid,
                  // @ts-ignore
                  address: resultDoc.address,
                  // @ts-ignore
                  teleNo: resultDoc.teleNo,
                  // @ts-ignore
                  school: resultDoc.school,
                  // @ts-ignore
                  fullName: resultDoc.fullName,
                  // grade: doc.grade.toString().concat(doc.number.toString()),
                  className: doc.name,
                  classType: doc.type,
                  grade: grade,
                });
              });
              this.dataSource = new MatTableDataSource(this.student);
              this.dataSource.paginator = this.paginator;
              this.dataSource.sort = this.sort;
            });
        });
        return docs;
      });

    return this.classSubscribe;
  }


  getRecord(row: any) {

    if (this.addStudentShow) {
      this.buttonText = 'Insert Student';
      this.addStudentShow = false;
    }

    this.updateStudentShow = false;
    this.studentIdReportCard = row;

  }

  algolia(){
    // this.search = instantSearch({
    //   indexName: environment.algolia.indexName,
    //   searchClient: algoliaSearch(
    //     environment.algolia.appId,
    //     environment.algolia.apiKey
    //   ),
    // });
    // this.search.addWidget(
    //   searchBox({
    //     container: '#search-box',
    //     autofocus: false,
    //     palceholder: 'Search',
    //     poweredBy: true,
    //     clickAnalytics: true,
    //   })
    // );
    //
    // this.search.addWidget(
    //   hits({
    //     container: '#hits',
    //     templates: {
    //       item(hit) {
    //         return `
    //         <article>
    //           <h3> ${instantSearch.highlight({ attribute: 'fullName', hit })} </h3>
    //         </article>
    //       `;
    //       }
    //     }
    //   })
    // );
    //
    // this.search.start();
  }


  // show_hide_add_class_content

  showAddStudent() {
    this.studentIdReportCard = null;
    this.updateStudentShow = false;
    this.addStudentShow ? this.buttonText = 'Insert student' : this.buttonText = 'Hide form';
    this.addStudentShow = !this.addStudentShow;

  }


  Update(row: any) {
    this.updateStudentShow = true;
    this.addStudentShow = false;
    this.studentIdReportCard = false;
    this.studentDetails = row;
  }

  async modelChanged($event: any) {
    if(this.gradeSelected === this.previousGrade){
      return;
    }
    this.showDataTables = false;
    // console.log($event);
    // console.log(this.gradeSelected);
    await this.fetchStudentData(Number($event));
    this.showDataTables = true;
  }
}
