import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SetupformComponent} from './setupform/setupform.component';


const routes: Routes = [
  {
    path:'',component:SetupformComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
