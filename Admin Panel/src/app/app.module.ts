import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {RouterModule} from '@angular/router';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {HttpClientModule, HttpClient} from '@angular/common/http';
import {LocationStrategy, PathLocationStrategy} from '@angular/common';
import {AppRoutes} from './app.routing';
import {AppComponent} from './app.component';

import {FlexLayoutModule} from '@angular/flex-layout';
import {FullComponent} from './layouts/full/full.component';
import {AppHeaderComponent} from './layouts/full/header/header.component';
import {AppSidebarComponent} from './layouts/full/sidebar/sidebar.component';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';

import {DemoMaterialModule} from './demo-material-module';
import {MatPasswordStrengthModule} from '@angular-material-extensions/password-strength';
import { NgxMatDatetimePickerModule, NgxMatTimepickerModule, NgxMatNativeDateModule } from '@angular-material-components/datetime-picker';

import {SharedModule} from './shared/shared.module';
import {SpinnerComponent} from './shared/spinner.component';

// firebase
import {AngularFireModule} from '@angular/fire';
import {AngularFirestoreModule} from '@angular/fire/firestore';
import {AngularFireAuthModule} from '@angular/fire/auth';
import {environment} from '../environments/environment';

import {LoginComponent} from './login/login.component';
import {ERROR404Component} from './error404/error404.component';

import {ChartsModule} from 'ng2-charts';

@NgModule({
  declarations: [
    AppComponent,
    FullComponent,
    AppHeaderComponent,
    SpinnerComponent,
    AppSidebarComponent,
    LoginComponent,
    ERROR404Component
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    DemoMaterialModule,
    MatPasswordStrengthModule.forRoot(),
    FormsModule,
    FlexLayoutModule,
    HttpClientModule,
    SharedModule,
    NgxMatDatetimePickerModule,
    NgxMatTimepickerModule,
    NgxMatNativeDateModule,
    // firebase_initialization
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFirestoreModule,
    AngularFireAuthModule,
    RouterModule.forRoot(AppRoutes),
    ReactiveFormsModule,
    ChartsModule,
    // NgAisModule.forRoot()
  ],
  providers: [
    {
      provide: LocationStrategy,
      useClass: PathLocationStrategy
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
}
