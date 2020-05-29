import {NgModule} from '@angular/core';
import {RouterModule} from '@angular/router';
import {CommonModule} from '@angular/common';
import {DemoMaterialModule} from '../demo-material-module';
import {FlexLayoutModule} from '@angular/flex-layout';
import {DashboardComponent} from './dashboard.component';
import {DashboardRoutes} from './dashboard.routing';
import {ChartistModule} from 'ng-chartist';
import {AdminsComponent} from './admins/admins.component';
import {StudentsComponent} from './students/students.component';
import {ClassesComponent} from './classes/classes.component';
import {PapersComponent} from './papers/papers.component';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {UserprofileComponent} from './userprofile/userprofile.component';
import { PaymentsComponent } from './payments/payments.component';
import {DropzoneDirective} from './dropzone.directive';
import {UploaderComponent} from './uploader/uploader.component';
import { ViewComponent } from './papers/view/view.component';
import { UpdateComponent } from './papers/update/update.component';
import { CreateComponent } from './papers/create/create.component';
import { ViewClassComponent } from './classes/view-class/view-class.component';
import { LeaderboardComponent } from './leaderboard/leaderboard.component';
import { StudentReportComponent } from './students/student-report/student-report.component';
import { AddStudentComponent } from './students/add-student/add-student.component';
import { ReportComponent } from './classes/report/report.component';
import { PaperAccessComponent } from './paper-access/paper-access.component';
import { DeleteAccessComponent } from './paper-access/delete/delete.component';
import { UpdateAccessComponent } from './paper-access/update/update.component';
import { CreateAccessComponent } from './paper-access/create/create.component';



import { MatPasswordStrengthModule } from '@angular-material-extensions/password-strength';
import { NgAisModule} from 'angular-instantsearch';
import { ChartsModule } from 'ng2-charts';
import { NgxMatDatetimePickerModule, NgxMatTimepickerModule , NgxMatNativeDateModule} from '@angular-material-components/datetime-picker';
import { UpdateStudentComponent } from './students/update-student/update-student.component';
import { UpdateClassComponent } from './classes/update-class/update-class.component';
import { ViewTop10Component } from './leaderboard/view-top10/view-top10.component';
import { ViewAllRanksComponent } from './leaderboard/view-all-ranks/view-all-ranks.component';



@NgModule({
  imports: [
    CommonModule,
    DemoMaterialModule,
    FlexLayoutModule,
    ChartistModule,
    MatPasswordStrengthModule,
    FormsModule,
    NgxMatDatetimePickerModule,
    NgxMatTimepickerModule,
    NgxMatNativeDateModule,
    ReactiveFormsModule,
    NgAisModule,
    RouterModule.forChild(DashboardRoutes),
    ChartsModule,
  ],
  declarations: [
    DashboardComponent,
    AdminsComponent,
    StudentsComponent,
    ClassesComponent,
    PapersComponent,
    UserprofileComponent,
    PaymentsComponent,
    DropzoneDirective,
    UploaderComponent,
    ViewComponent,
    UpdateComponent,
    CreateComponent,
    ViewClassComponent,
    LeaderboardComponent,
    StudentReportComponent,
    AddStudentComponent,
    ReportComponent,
    PaperAccessComponent,
    DeleteAccessComponent,
    UpdateAccessComponent,
    CreateAccessComponent,
    UpdateStudentComponent,
    UpdateClassComponent,
    ViewTop10Component,
    ViewAllRanksComponent
  ]
})
export class DashboardModule {
}
