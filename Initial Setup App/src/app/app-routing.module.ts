import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SetupformComponent} from './setupform/setupform.component';
import { PaperComponent } from './paper/paper.component';


const routes: Routes = [
  {path:'',component:SetupformComponent},
  {path:'paper',component:PaperComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
