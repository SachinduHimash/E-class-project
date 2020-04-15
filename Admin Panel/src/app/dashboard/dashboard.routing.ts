import {Routes} from '@angular/router';

import {DashboardComponent} from './dashboard.component';
import {StudentComponent} from './student/student.component';
import {ClassesComponent} from './classes/classes.component';
import {PapersComponent} from './papers/papers.component';
import {AdminsComponent} from './admins/admins.component';

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
    path: 'student',
    component: StudentComponent
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
    path: 'admin',
    component: AdminsComponent
  }

];
