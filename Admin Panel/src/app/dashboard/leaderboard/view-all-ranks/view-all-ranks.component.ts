import {Component, OnInit, ViewChild, Input, OnChanges, SimpleChanges, Output, EventEmitter} from '@angular/core';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import {ReportComponent} from "../../classes/report/report.component";
import {MatDialog} from "@angular/material/dialog";

@Component({
  selector: 'app-view-all-ranks',
  templateUrl: './view-all-ranks.component.html',
  styleUrls: ['./view-all-ranks.component.css']
})
export class ViewAllRanksComponent implements OnInit, OnChanges {

  @Input() students;
  @Output() close = new EventEmitter<boolean>();

  displayedColumns = ['rank', 'mark', 'fullName', 'school', 'class'];
  dataSource: MatTableDataSource<any>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

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
