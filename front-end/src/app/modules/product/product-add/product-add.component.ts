import { Component, OnInit } from '@angular/core';
import {Product} from "../product";
import {ProductService} from "../../../services/product/product.service";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
  selector: 'app-product-add',
  templateUrl: './product-add.component.html',
  styleUrls: ['./product-add.component.css']
})
export class ProductAddComponent implements OnInit {

  id: any;
  product: Product = new Product();
  url: any;
  isUpdate= false;
  fileToUpload:string [] = [];

  constructor(private productService: ProductService,
              private router: Router,
              private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.id = this.route.snapshot.params['id'];
    if(this.id){
      this.isUpdate = true;
      this.getProductById(this.id);
    }
  }

  getProductById(id: any) {
    this.productService.getProductById(id).subscribe(data => {
      this.product = data;
      this.url = this.product.thumb.url;
    });
  }

  createProduct(){
    const productFormData = this.prepareFormData(this.product);
    this.productService.addNewProduct(productFormData).subscribe(data =>{
      this.goToProductList();
    });
  }
  updateProduct(id: any){
    const productFormData = this.prepareFormData(this.product);
    this.productService.updateProduct(id, productFormData).subscribe(data =>{
      this.goToProductList();
    });
  }

  prepareFormData(product: Product): FormData {
    const  formData = new FormData();
    formData.append(
      'product',
      new Blob([JSON.stringify(product)], {type: 'application/json'})
    );
    for (let i = 0; i < this.fileToUpload.length; i++){
      formData.append(
        'thumb',
        this.fileToUpload[i]
        // this.fileToUpload[i].name
      )
    }
    // formData.append('thumb', this.fileToUpload, this.fileToUpload.name);

    return formData;
  }

  goToProductList(){
    this.router.navigate(['/d/product']);
  }

  onSubmit(){
    if(this.id){
      this.updateProduct(this.id);
    }else{
      this.createProduct();
    }
  }


  onChange(event: any) {
    // this.fileToUpload.push(event.target.files[0]);

    const files = event.target.files;
    if (files.length === 0)
      return;

    const reader = new FileReader();
    this.fileToUpload = files;


    reader.readAsDataURL(files[0]);
    reader.onload = (_event) => {
      this.url = reader.result;
    }
  }

  notNeedFile(){
    // @ts-ignore
    document.getElementById("file-in").value = null;
    this.url = null;
    // this.onChange(this.fileToUpload);
  }

}
