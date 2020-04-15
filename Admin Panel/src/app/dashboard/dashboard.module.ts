import {NgModule} from '@angular/core';
import {RouterModule} from '@angular/router';
import {CommonModule} from '@angular/common';
import {DemoMaterialModule} from '../demo-material-module';
import {FlexLayoutModule} from '@angular/flex-layout';
import {DashboardComponent} from './dashboard.component';
import {DashboardRoutes} from './dashboard.routing';
import {ChartistModule} from 'ng-chartist';
import {StudentComponent} from './student/student.component';
import {ClassesComponent} from './classes/classes.component';
import { PapersComponent } from './papers/papers.component';
import { AdminsComponent } from './admins/admins.component';
import {ReactiveFormsModule} from '@angular/forms';

@NgModule({
  imports: [
    CommonModule,
    DemoMaterialModule,
    FlexLayoutModule,
    ChartistModule,
    RouterModule.forChild(DashboardRoutes),
    ReactiveFormsModule
  ],
  declarations: [DashboardComponent, StudentComponent, ClassesComponent, PapersComponent, AdminsComponent]
})
export class DashboardModule {
}
