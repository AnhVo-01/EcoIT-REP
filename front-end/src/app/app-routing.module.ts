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
import {RecruitControlComponent} from "./modules/recruit/recruit-control/recruit-control.component";
import {RecruitAddComponent} from "./modules/recruit/recruit-add/recruit-add.component";
import {RecruitListComponent} from "./modules/recruit/recruit-list/recruit-list.component";
import {NavAddComponent} from "./modules/home/navigator/nav-add/nav-add.component";
import {PostListComponent} from "./modules/post/post-list/post-list.component";
import {PostDetailsComponent} from "./modules/post/post-details/post-details.component";

const routes: Routes = [
  {path: 'trang-chu', component: HomeComponent},
  {path: 'tuyen-dung', component: RecruitListComponent},
  {path: 'tin-tuc', component: PostListComponent},
  {path: 'tin-tuc/:url', component: PostDetailsComponent},


  {path: 'd/customer', component: CustomerControlComponent},
  {path: 'd/customer/add-new-customer', component: CustomerAddComponent},
  {path: 'd/customer/update-cus/:id', component: CustomerAddComponent},

  {path: 'd/post', component: PostControlComponent},
  {path: 'd/post/new', component: PostAddComponent},
  {path: 'd/post/update/:id', component: PostAddComponent},

  {path: 'd/recruit', component: RecruitControlComponent},
  {path: 'd/recruit/new', component: RecruitAddComponent},
  {path: 'd/recruit/update/:id', component: RecruitAddComponent},

  {path: 'd/product', component: ProductControlComponent},
  {path: 'd/product/new', component: ProductAddComponent},
  {path: 'd/product/update/:id', component: ProductAddComponent},

  {path: 'd/sliders', component: SliderControlComponent},
  {path: 'd/sliders/add-new', component: SliderAddComponent},
  {path: 'd/sliders/update/:id', component: SliderAddComponent},

  {path: 'd/navigation', component: NavControlComponent},
  {path: 'd/navigation/add-new', component: NavAddComponent},
  {path: 'd/navigation/update/:id', component: NavAddComponent},

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
