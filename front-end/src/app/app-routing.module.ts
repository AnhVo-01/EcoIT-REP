import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {CustomerControlComponent} from "./modules/customer/customer-control/customer-control.component";
import {CustomerAddComponent} from "./modules/customer/customer-add/customer-add.component";
import {HomeComponent} from "./modules/home/home-page/home.component";
import {PageNotFoundComponent} from "./authentication/404/page-not-found.component";
import {DashBoardComponent} from "./modules/admin/dash-board/dash-board.component";
import {LoginComponent} from "./authentication/login/login.component";
import {RegisterComponent} from "./authentication/register/register.component";

const routes: Routes = [
  {path: 'trang-chu', component: HomeComponent},
  {path: 'admin', component: LoginComponent},
  {path: 'd/bang-dieu-khien', component: DashBoardComponent},

  {path: 'd/customer', component: CustomerControlComponent},
  {path: 'd/customer/add-new-customer', component: CustomerAddComponent},
  {path: 'd/customer/update-cus/:id', component: CustomerAddComponent},

  {path: 'register', component: RegisterComponent},
  {path: 'login', component: LoginComponent},

  {path: '', redirectTo: '/trang-chu', pathMatch: 'full'}
  // {path: '**', component: PageNotFoundComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
