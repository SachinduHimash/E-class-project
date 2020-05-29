import {Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges, ViewChild} from '@angular/core';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import {ReportComponent} from "../../classes/report/report.component";
import {MatDialog} from "@angular/material/dialog";
@Component({
  selector: 'app-view-top10',
  templateUrl: './view-top10.component.html',
  styleUrls: ['./view-top10.component.css']
})
export class ViewTop10Component implements OnInit, OnChanges {

  @Input() students;

  displayedColumns = [  'pic', 'rank', 'mark', 'fullName', 'school', 'class'];
  dataSource: MatTableDataSource<any>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  @Output() close = new EventEmitter<boolean>();

  constructor(public dialog: MatDialog) { }


  ngOnInit(): void {
    this.dataSource = new MatTableDataSource(this.students.rank);
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  async ngOnChanges(changes: SimpleChanges) {
    if (changes.students.currentValue !== changes.students.previousValue) {
      this.dataSource = new MatTableDataSource(this.students.rank);
      this.dataSource.paginator = this.paginator;
      this.dataSource.sort = this.sort;
    }
  }
  applyFilter(filterValue: string) {
    filterValue = filterValue.trim();
    filterValue = filterValue.toLowerCase();
    this.dataSource.filter = filterValue;
  }

  closeWindow() {
    this.close.emit(true);
  }

  getRecords(row: any) {
    row.grade = row.class;
    this.dialog.open(ReportComponent, {
      width: '600px',
      data: row
    });
  }
}
