import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SetupformComponent} from './setupform/setupform.component';
import { PaperComponent } from './paper/paper.component';
import { MarkingsheetComponent } from './markingsheet/markingsheet.component';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { RankComponent } from './rank/rank.component';


const routes: Routes = [
  {path: '', component: LoginComponent},
  {path: 'signup', component: SetupformComponent},
  {path: 'paper', component: PaperComponent},
  { path: 'home', component: HomeComponent },
  { path: 'rank', component: RankComponent },
  {path: 'markingsheet', component: MarkingsheetComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
