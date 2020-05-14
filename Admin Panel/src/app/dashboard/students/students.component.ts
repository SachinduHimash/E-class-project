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
  buttonText = 'Insert student';

  // list_of_student
  @Input() student = [];

  // table
  displayedColumns = ['uid', 'fullName', 'className'];
  dataSource: MatTableDataSource<any>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
  studentIdReportCard: any;


  private classSubscribe: Subscription;
  private studentSubscribe: Subscription;
  private search: any;

  constructor(private _af: AngularFirestore) {
  }

  ngOnInit(): void {
    this.fetchStudentData();
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


  ngOnDestroy() {
    this.classSubscribe.unsubscribe();
    this.studentSubscribe.unsubscribe();
  }

  applyFilter(filterValue) {
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
                  classType: doc.type,
                  grade: grade,
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

    if (this.addStudentShow) {
      this.buttonText = 'Insert Student';
      this.addStudentShow = false;
    }
    console.table(row);
    this.studentIdReportCard = row;

  }


  // show_hide_add_class_content
  showAddStudent() {
    this.studentIdReportCard = null;
    this.addStudentShow ? this.buttonText = 'Insert student' : this.buttonText = 'Hide form';
    this.addStudentShow = !this.addStudentShow;

  }

  hirhg(hdewf) {
    console.log('rmginege');
    console.log(hdewf);
  }
}
