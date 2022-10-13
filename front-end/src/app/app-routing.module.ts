import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {CustomerControlComponent} from "./modules/customer/customer-control/customer-control.component";
import {CustomerAddComponent} from "./modules/customer/customer-add/customer-add.component";
import {HomeComponent} from "./modules/home/home-page/home.component";
import {PageNotFoundComponent} from "./authentication/404/page-not-found.component";
import {DashBoardComponent} from "./modules/admin/dash-board/dash-board.component";
import {LoginComponent} from "./authentication/login/login.component";
import {RegisterComponent} from "./authentication/register/register.component";
import {SliderControlComponent} from "./modules/sliders/slider-control/slider-control.component";
import {SliderAddComponent} from "./modules/sliders/slider-add/slider-add.component";
import {PostAddComponent} from "./modules/post/post-add/post-add.component";
import {PostControlComponent} from "./modules/post/post-control/post-control.component";
import {ProductControlComponent} from "./modules/product/product-control/product-control.component";
import {ProductAddComponent} from "./modules/product/product-add/product-add.component";
import {NavControlComponent} from "./modules/home/navigator/nav-control/nav-control.component";

const routes: Routes = [
  {path: 'trang-chu', component: HomeComponent},

  {path: 'd/customer', component: CustomerControlComponent},
  {path: 'd/customer/add-new-customer', component: CustomerAddComponent},
  {path: 'd/customer/update-cus/:id', component: CustomerAddComponent},

  {path: 'd/post', component: PostControlComponent},
  {path: 'd/post/new', component: PostAddComponent},
  {path: 'd/post/update/:id', component: PostAddComponent},

  {path: 'd/product', component: ProductControlComponent},
  {path: 'd/product/new', component: ProductAddComponent},
  {path: 'd/product/update/:id', component: ProductAddComponent},

  {path: 'd/sliders', component: SliderControlComponent},
  {path: 'd/sliders/add-new', component: SliderAddComponent},
  {path: 'd/sliders/update/:id', component: SliderAddComponent},

  {path: 'd/navigation', component: NavControlComponent},
  {path: 'd/navigation/add-new', component: SliderAddComponent},
  {path: 'd/navigation/update/:id', component: SliderAddComponent},

  {path: 'register', component: RegisterComponent},
  {path: 'login', component: LoginComponent},

  {path: 'dashboard', component: DashBoardComponent},
  {path: '', redirectTo: '/trang-chu', pathMatch: 'full'},
  {path: '**', component: PageNotFoundComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
