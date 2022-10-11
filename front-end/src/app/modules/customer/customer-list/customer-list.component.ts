import { Component, OnInit } from '@angular/core';
import {CustomerService} from "../../../services/customer/customer.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-customer-list',
  templateUrl: './customer-list.component.html',
  styleUrls: ['./customer-list.component.css']
})
export class CustomerListComponent implements OnInit {

  customer: any;

  constructor(private cusService: CustomerService, private router: Router) { }

  ngOnInit(): void {
    this.getCustomer();
  }

  private getCustomer(){
    this.cusService.getCustomerList().subscribe(data => {
      this.customer = data;
    })
  }

}
