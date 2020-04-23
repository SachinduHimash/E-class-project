import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SetupformComponent} from './setupform/setupform.component';
import { PaperComponent } from './paper/paper.component';
import { MarkingsheetComponent } from './markingsheet/markingsheet.component';


const routes: Routes = [
  {path:'',component:SetupformComponent},
  {path:'paper',component:PaperComponent},
  {path:'markingsheet',component:MarkingsheetComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
