import { Component, OnInit } from '@angular/core';
import {Customer} from "../customer";
import {ActivatedRoute, Router} from "@angular/router";
import {CustomerService} from "../../../services/customer/customer.service";
import {Product} from "../../product/product";
import {ProductService} from "../../../services/product/product.service";

@Component({
  selector: 'app-customer-add',
  templateUrl: './customer-add.component.html',
  styleUrls: ['./customer-add.component.css']
})
export class CustomerAddComponent implements OnInit {

  id: any;
  customer: Customer = new Customer();
  product: Product[] = [];

  image: any;
  fileToUpload: string [] = [];

  constructor(private cusService: CustomerService, private productService: ProductService,
              private route: ActivatedRoute, private router: Router) {
  }

  ngOnInit(): void {
    window.sessionStorage.removeItem("redirect");
    this.id = this.route.snapshot.params['id'];
    if (this.id) {
      this.getCustomById(this.id);
    }

    this.productService.getProductList().subscribe(data =>{
      this.product = data;
    })
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

  onChange(event: any) {
    const files = event.target.files;
    if (files.length === 0) return;

    const reader = new FileReader();
    this.fileToUpload = files;

    reader.readAsDataURL(files[0]);
    reader.onload = (_event) => {
      this.image = reader.result;
    }
  }

  notNeedFile(){
    // @ts-ignore
    document.getElementById("file-in").value = null;
    this.image = null;
    // this.onChange(this.fileToUpload);
  }

  addMoreProduct(){
    window.sessionStorage.setItem("redirect", "/d/customer/add-new-customer");
    this.router.navigate(['/d/product/new']);
  }

}
