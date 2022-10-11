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
import {NavigatorComponent} from "./modules/home/navigator/navigator.component";
import {DashBoardComponent} from "./modules/admin/dash-board/dash-board.component";
import {LoginComponent} from "./authentication/login/login.component";
import {RegisterComponent} from "./authentication/register/register.component";
import {PageNotFoundComponent} from "./authentication/404/page-not-found.component";

@NgModule({
  declarations: [
    AppComponent,
    // NewsListComponent,
    // NewsUpdateComponent,
    // NewsAddComponent,
    // NewsDetailComponent,
    CustomerListComponent,
    HideMissingDirective,
    CustomerControlComponent,
    CustomerAddComponent,
    // ProductListComponent,
    // ProductCreateComponent,
    // ProductUpdateComponent,
    LoginComponent,
    RegisterComponent,
    HomeComponent,
    PageNotFoundComponent,
    DashBoardComponent,
    // FileComponent,
    HeaderComponent,
    // TrashCustomerComponent,
    // GroupRecruitPostComponent,
    // RecruitListComponent,
    // RecruitAddComponent,
    // RecruitControlComponent,
    NavigatorComponent,
    AsideComponent
    // UserComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    RouterOutlet,
    FormsModule,
    NgxPaginationModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
