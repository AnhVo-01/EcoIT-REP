import { Component, OnInit } from '@angular/core';
import {Recruit} from "../recruit";
import {RecruitService} from "../../../services/recruit/recruit.service";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
  selector: 'app-recruit-add',
  templateUrl: './recruit-add.component.html',
  styleUrls: ['./recruit-add.component.css']
})
export class RecruitAddComponent implements OnInit {

  id: any;
  recruit: Recruit = new Recruit();
  url: any;
  isUpdate= false;
  fileToUpload:string [] = [];

  constructor(private recruitService: RecruitService,
              private router: Router,
              private route: ActivatedRoute) { }

  ngOnInit(): void {
    // this.id = this.route.snapshot.params['id'];
    // if(this.id){
    //   this.isUpdate = true;
    //   this.getRecruitById(this.id);
    // }
  }

  // getRecruitById(id: any) {
  //   this.productService.getProductById(id).subscribe(data => {
  //     this.product = data;
  //     this.url = this.product.thumb.url;
  //   });
  // }

  createRecruit(){
    const productFormData = this.prepareFormData(this.recruit);
    this.recruitService.addRecruit(productFormData).subscribe(data =>{
      this.goToRecruitList();
    });
  }
  // updateProduct(id: any){
  //   const productFormData = this.prepareFormData(this.product);
  //   this.recruitService.updateProduct(id, productFormData).subscribe(data =>{
  //     this.goToProductList();
  //   });
  // }

  prepareFormData(recruit: Recruit): FormData {
    const  formData = new FormData();
    formData.append(
      'recruit',
      new Blob([JSON.stringify(recruit)], {type: 'application/json'})
    );
    for (let i = 0; i < this.fileToUpload.length; i++){
      formData.append(
        'thumb',
        this.fileToUpload[i]
        // this.fileToUpload[i].name
      )
    }

    return formData;
  }

  goToRecruitList(){
    this.router.navigate(['/d/recruit']);
  }

  onSubmit(){
    this.createRecruit();
  }


  onFileChange(event: any) {
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
    console.log(this.fileToUpload);
  }

}
