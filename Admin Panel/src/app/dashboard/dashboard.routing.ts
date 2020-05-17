import {Routes} from '@angular/router';

import {AngularFireAuthGuard, hasCustomClaim} from '@angular/fire/auth-guard';

// import {DashboardComponent} from './dashboard.component';
import {StudentsComponent} from './students/students.component';
import {ClassesComponent} from './classes/classes.component';
import {PapersComponent} from './papers/papers.component';
import {AdminsComponent} from './admins/admins.component';
import {UserprofileComponent} from './userprofile/userprofile.component';
import {UploaderComponent} from './uploader/uploader.component';
import {LeaderboardComponent} from './leaderboard/leaderboard.component';
const adminOnly = () => hasCustomClaim('admin');
export const DashboardRoutes: Routes = [
  {
    path: '',
    component: ClassesComponent,
    canActivate: [AngularFireAuthGuard],
    data: {
      authGuardPipe: adminOnly,
    },
  },
  {
    path: 'dashboard',
    component: ClassesComponent,
    canActivate: [AngularFireAuthGuard],
    data: {
      authGuardPipe: adminOnly,
    },
  },
  {
    path: 'students',
    component: StudentsComponent,
    canActivate: [AngularFireAuthGuard],
    data: {
      authGuardPipe: adminOnly,
    },
  },
  {
    path: 'classes',
    component: ClassesComponent,
    canActivate: [AngularFireAuthGuard],
    data: {
      authGuardPipe: adminOnly,
    },
  },
  {
    path: 'papers',
    component: PapersComponent,
    canActivate: [AngularFireAuthGuard],
    data: {
      authGuardPipe: adminOnly,
    },
  },
  {
    path: 'admins',
    component: AdminsComponent,
    canActivate: [AngularFireAuthGuard],
    data: {
      authGuardPipe: adminOnly,
    },
  },
  // {
  //   path: 'leaderboard',
  //   component: LeaderboardComponent,
  //   canActivate: [AngularFireAuthGuard],
  //   data: {
  //     authGuardPipe: adminOnly,
  //   },
  // },
  {
    path: 'profile',
    component: UserprofileComponent,
    canActivate: [AngularFireAuthGuard],
    data: {
      authGuardPipe: adminOnly,
    },
  },
  {
    path: 'uploader',
    component: UploaderComponent,
    canActivate: [AngularFireAuthGuard],
    data: {
      authGuardPipe: adminOnly,
    },
  }
];
