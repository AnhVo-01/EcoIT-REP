import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {RouterModule, Routes} from "@angular/router";
import {CustomerControlComponent} from "../customer/customer-control/customer-control.component";
import {CustomerAddComponent} from "../customer/customer-add/customer-add.component";

const routes: Routes = [
  {path: '', component: CustomerControlComponent},
  {path: 'add-new-customer', title: 'Admin - Khách hàng', component: CustomerAddComponent},
  {path: 'update-cus/:id', title: 'Admin - Khách hàng', component: CustomerAddComponent},
]

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    RouterModule.forChild(routes),
  ],
  exports: [RouterModule]
})
export class CustomerModule { }
