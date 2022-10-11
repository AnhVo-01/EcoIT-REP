import { Component, OnInit } from '@angular/core';
import {Customer} from "../customer";
import {ActivatedRoute, Router} from "@angular/router";
import {CustomerService} from "../../../services/customer/customer.service";

@Component({
  selector: 'app-customer-add',
  templateUrl: './customer-add.component.html',
  styleUrls: ['./customer-add.component.css']
})
export class CustomerAddComponent implements OnInit {

  id: any;
  customer: Customer = new Customer();

  constructor(private cusService: CustomerService, private route: ActivatedRoute, private router: Router) {
  }

  ngOnInit(): void {
    this.id = this.route.snapshot.params['id'];
    if (this.id) {
      this.getCustomById(this.id);
    }
  }

  getCustomById(id: number) {
    this.cusService.getCusById(id).subscribe(data => {
      this.customer = data;
    });
  }

  addCustomer(){
    this.cusService.newCustomer(this.customer).subscribe(data =>{
      this.goToCustomerList();
    })
  }

  goToCustomerList(){
    this.router.navigate(['/d/customer']);
  }

  onSubmit(){
    console.log(this.id)
    if(this.id != null){
      this.cusService.updateCustomer(this.id, this.customer).subscribe(data=>{
        this.goToCustomerList();
      })
    }

    this.addCustomer();
  }

}
