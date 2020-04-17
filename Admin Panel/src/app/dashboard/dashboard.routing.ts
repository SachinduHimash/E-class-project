import {Routes} from '@angular/router';

import {DashboardComponent} from './dashboard.component';
import {StudentsComponent} from './students/students.component';
import {ClassesComponent} from './classes/classes.component';
import {PapersComponent} from './papers/papers.component';
import {AdminsComponent} from './admins/admins.component';
import {UserprofileComponent} from './userprofile/userprofile.component';

export const DashboardRoutes: Routes = [
  {
    path: '',
    component: DashboardComponent
  },
  {
    path: 'dashboard',
    component: DashboardComponent
  },
  {
    path: 'students',
    component: StudentsComponent
  },
  {
    path: 'classes',
    component: ClassesComponent
  },
  {
    path: 'papers',
    component: PapersComponent
  },
  {
    path: 'admins',
    component: AdminsComponent
  },
  {
    path: 'profile',
    component: UserprofileComponent
  }
];
