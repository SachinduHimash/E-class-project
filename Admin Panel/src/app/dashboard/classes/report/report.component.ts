import {Component, Inject, OnInit} from '@angular/core';
import {ChartDataSets} from 'chart.js';
import {Color, Label} from 'ng2-charts';
import {Subscription} from 'rxjs';
import {AngularFirestore} from '@angular/fire/firestore';
import {NotificationService} from '../../services/notification.service';
import {ClassStudentMarks} from '../../interfaces/databaseInterfaces';
import {MAT_DIALOG_DATA, MatDialogRef} from '@angular/material';

@Component({
  selector: 'app-report',
  templateUrl: '../../students/student-report/student-report.component.html',
  styleUrls: ['../../students/student-report/student-report.component.css']
})
export class ReportComponent implements OnInit {

// if_student_marks_not_found
  marks404;
  progress = true;
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
          beginAtZero: true,
          suggestedMax: 100
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
  studentId;

  constructor(private _af: AngularFirestore,
              private _notificationService: NotificationService,
              public dialogRef: MatDialogRef<ReportComponent>,
              @Inject(MAT_DIALOG_DATA) public dataReceive) {
  }

  ngOnInit() {
    // console.log(this.dataReceive);
    this.studentId = this.dataReceive;
    this.fetchStudentData(this.dataReceive.grade, this.dataReceive.id);
  }

  fetchStudentData(grade, studentId) {
    // console.log(this.studentId);
    this.studentDataSubscribe = this._af.collection(`class/${grade}/students/${studentId}/marks`)
      .valueChanges({idField: 'id'})
      .subscribe((value: ClassStudentMarks[]) => {
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
        if(this.lineChartLabels.length > 0){
          this.progress = false;
        }
      });
  }

}
