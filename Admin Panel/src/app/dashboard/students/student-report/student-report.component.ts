import {Component, Inject, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {Color, Label} from 'ng2-charts';
import {ChartDataSets} from 'chart.js';
import {AngularFirestore} from '@angular/fire/firestore';

import {ClassStudentMarks} from '../../interfaces/databaseInterfaces';
import {Subscription} from 'rxjs';
import {NotificationService} from '../../services/notification.service';
import {MAT_DIALOG_DATA, MatDialogRef} from '@angular/material';

@Component({
  selector: 'app-student-report',
  templateUrl: './student-report.component.html',
  styleUrls: ['./student-report.component.css']
})
export class StudentReportComponent implements OnInit, OnChanges {


  @Input() studentId;

  // if_student_marks_not_found
  marks404;

  lineChartData: ChartDataSets[] = [
    {
      data: [],
      label: 'Marks',
      type: 'line'
    },
    {
      data: [],
      label: 'Marks',
      type: 'bar'
    },
  ];

  lineChartLabels: Label[] = [];

  lineChartOptions = {
    responsive: true,
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    }
  };

  lineChartColors: Color[] = [
    { // teal
      backgroundColor: 'rgba(115, 221, 137, 0)',
      borderColor: 'rgb(22,3,37)',
    },
    { // deep purple
      backgroundColor: '#1E88E5',
    }
  ];

  lineChartLegend = false;
  lineChartPlugins = [];
  lineChartType = 'line';
  NoOfPapers: number;
  averageMarks: number;
  lastPaperMarks: number;
  studentDataSubscribe: Subscription;
  id: string;
  studentName: string;

  constructor(private _af: AngularFirestore,
              private _notificationService: NotificationService,) {
  }

  ngOnInit() {
    console.table('init student report');
  }

  ngOnChanges(changes: SimpleChanges): void {
    console.log(this.studentId);
    if (this.studentId) {
      this.fetchStudentData(this.studentId.grade, this.studentId.uid);
    }
  }


  //
  fetchStudentData(grade, studentId) {
    this.studentDataSubscribe = this._af.collection(`class/${grade}/students/${studentId}/marks`)
      .valueChanges({idField: 'id'})
      .subscribe((value: ClassStudentMarks[]) => {
        console.table(value);
        this.marks404 = false;
        this.marks404 = !value;
        this.lineChartData[0].data = this.lineChartData[1].data = [];
        this.lineChartLabels = [];
        this.lineChartLabels = value.map(r => r.id.substr(r.id.length - 3));
        this.lineChartData[0].data = this.lineChartData[1].data = value.map(r => r.mark);
        this.studentName = value.map(r => r.name).pop();
        this.id = value.map(r => r.id).pop();
        this.lastPaperMarks = value.map(r => r.mark).pop();
        this.NoOfPapers = this.lineChartLabels.length;
        this.averageMarks = Math.round(value.reduce((acc, item) => acc + item.mark, 0) / this.lineChartLabels.length);
      });
  }
}
