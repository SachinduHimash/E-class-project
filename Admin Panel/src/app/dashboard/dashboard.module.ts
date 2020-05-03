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
import { StudentListComponent } from './students/student-list/student-list.component';
import { StudentReportComponent } from './students/student-report/student-report.component';

import { ChartsModule } from 'ng2-charts';
import { AddStudentComponent } from './students/add-student/add-student.component';

import { MatPasswordStrengthModule } from '@angular-material-extensions/password-strength';
import { NgAisModule} from 'angular-instantsearch';
import { ReportComponent } from './classes/report/report.component';

@NgModule({
  imports: [
    CommonModule,
    DemoMaterialModule,
    FlexLayoutModule,
    ChartistModule,
    MatPasswordStrengthModule,
    FormsModule,
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
    StudentListComponent,
    StudentReportComponent,
    AddStudentComponent,
    ReportComponent,
  ]
})
export class DashboardModule {
}
