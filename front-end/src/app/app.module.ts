import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { CustomerAddComponent } from './modules/customer/customer-add/customer-add.component';
import { CustomerListComponent } from './modules/customer/customer-list/customer-list.component';
import { HideMissingDirective } from './hide-missing.directive';
import { CustomerControlComponent } from './modules/customer/customer-control/customer-control.component';
import {AppRoutingModule} from "./app-routing.module";
import {FormsModule} from "@angular/forms";
import {RouterOutlet} from "@angular/router";
import {HttpClientModule} from "@angular/common/http";
import {HomeComponent} from "./modules/home/home-page/home.component";
import { NgxPaginationModule } from 'ngx-pagination';
import {AsideComponent} from "./modules/admin/aside/aside.component";
import {HeaderComponent} from "./modules/admin/header/header.component";
import {DashBoardComponent} from "./modules/admin/dash-board/dash-board.component";
import {LoginComponent} from "./authentication/login/login.component";
import {RegisterComponent} from "./authentication/register/register.component";
import {PageNotFoundComponent} from "./authentication/404/page-not-found.component";
import { SliderControlComponent } from './modules/sliders/slider-control/slider-control.component';
import { SliderListComponent } from './modules/sliders/slider-list/slider-list.component';
import { SliderAddComponent } from './modules/sliders/slider-add/slider-add.component';
import { PostAddComponent } from './modules/post/post-add/post-add.component';
import { PostControlComponent } from './modules/post/post-control/post-control.component';
import { NavListComponent } from './modules/navigator/nav-list/nav-list.component';
import { ProductAddComponent } from './modules/product/product-add/product-add.component';
import { ProductListComponent } from './modules/product/product-list/product-list.component';
import { ProductControlComponent } from './modules/product/product-control/product-control.component';
import { RecruitPostComponent } from './modules/home/group/recruit-post/recruit-post.component';
import { AboutHomeComponent } from './modules/about/about-home/about-home.component';
import { AboutControlComponent } from './modules/about/about-control/about-control.component';
import { AboutDetailsComponent } from './modules/about/about-details/about-details.component';
import { PostListComponent } from './modules/post/post-list/post-list.component';
import { PostDetailsComponent } from './modules/post/post-details/post-details.component';
import { RecruitControlComponent } from './modules/recruit/recruit-control/recruit-control.component';
import { RecruitAddComponent } from './modules/recruit/recruit-add/recruit-add.component';
import { RecruitListComponent } from './modules/recruit/recruit-list/recruit-list.component';
import { RecruitDetailsComponent } from './modules/recruit/recruit-details/recruit-details.component';
import { NavAddComponent } from './modules/navigator/nav-add/nav-add.component';
import { FooterComponent } from './modules/home/footer/footer.component';
import { CKEditorModule } from 'ckeditor4-angular';
import {ModalModule} from "ngb-modal";
import { AdminComponent } from './modules/admin/admin/admin.component';
import {NavControlComponent} from "./modules/navigator/nav-control/nav-control.component";
import { CustomerDetailsComponent } from './modules/customer/customer-details/customer-details.component';

@NgModule({
  declarations: [
    AppComponent,
    CustomerListComponent,
    HideMissingDirective,
    CustomerControlComponent,
    CustomerAddComponent,
    LoginComponent,
    RegisterComponent,
    HomeComponent,
    PageNotFoundComponent,
    DashBoardComponent,
    HeaderComponent,
    AsideComponent,
    SliderControlComponent,
    SliderListComponent,
    SliderAddComponent,
    PostAddComponent,
    PostControlComponent,
    NavListComponent,
    ProductAddComponent,
    ProductListComponent,
    ProductControlComponent,
    NavControlComponent,
    RecruitPostComponent,
    AboutHomeComponent,
    AboutControlComponent,
    AboutDetailsComponent,
    PostListComponent,
    PostDetailsComponent,
    RecruitControlComponent,
    RecruitAddComponent,
    RecruitListComponent,
    RecruitDetailsComponent,
    NavAddComponent,
    FooterComponent,
    AdminComponent,
    CustomerDetailsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    RouterOutlet,
    FormsModule,
    NgxPaginationModule,
    CKEditorModule,
    ModalModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
