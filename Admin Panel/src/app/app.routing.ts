import {Routes} from '@angular/router';

import {FullComponent} from './layouts/full/full.component';
import {LoginComponent} from './login/login.component';
import {ERROR404Component} from './error404/error404.component';

// sidebar_routes_configure_on_'./shared/menu_item/menu_item.ts'_&_show_in_'./layout/full/sidebar'_component

export const AppRoutes: Routes = [

  {
    path: '',
    component: FullComponent,
    children: [
      {
        path: '',
        redirectTo: '/dashboard',
        pathMatch: 'full'
      },
      {
        path: '',
        loadChildren: () => import('./dashboard/dashboard.module').then(m => m.DashboardModule)
      }
    ]
  },
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: '**',
    component: ERROR404Component
  }

  // original_routes_on_template

  // {
  //   path: '',
  //   component: FullComponent,
  //   children: [
  //     {
  //       path: '',
  //       redirectTo: '/dashboard',
  //       pathMatch: 'full'
  //     },
  //     {
  //       path: '',
  //       loadChildren:
  //         () => import('./material-component/material.module').then(m => m.MaterialComponentsModule)
  //     },
  //     {
  //       path: 'dashboard',
  //       loadChildren: () => import('./dashboard/dashboard.module').then(m => m.DashboardModule)
  //     }
  //   ]
  // },
];







