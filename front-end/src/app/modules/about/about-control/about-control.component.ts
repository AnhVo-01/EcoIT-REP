import { Component, OnInit } from '@angular/core';
import {About} from "../about";
import {AboutService} from "../../../services/about/about.service";
import {AddressService} from "../../../services/address/address.service";
import {DomSanitizer} from "@angular/platform-browser";
import {Address} from "../../address/address";

@Component({
  selector: 'app-about-control',
  templateUrl: './about-control.component.html',
  styleUrls: ['./about-control.component.css']
})
export class AboutControlComponent implements OnInit {

  about: About = new About();
  addrress: Address = new Address();
  ckeConfig: any;

  provinces: any;
  districts: any;
  wards: any;

  provinceSelected = 0;
  distSelected = 0;
  wSelected = 0;

  constructor(private aboutService: AboutService, private addressService: AddressService, private sanitizer: DomSanitizer) { }

  ngOnInit(): void {

    this.goToInfo();

    this.addressService.getProvinces().subscribe(data =>{
      this.provinces = data;
    })

    this.ckeConfig = {
      extraPlugins: 'uploadimage, justify, colorbutton, colordialog, iframe, font',
      uploadUrl: 'https://ckeditor.com/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json',
      height: 330,
      filebrowserUploadUrl:'https://ckeditor.com/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Files',
      filebrowserImageUploadUrl:'https://ckeditor.com/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Images',

    };
  }

  goToInfo(){
    this.aboutService.getInfo().subscribe(data =>{
      if(data != null){
        this.about = data;
      }
    })
  }

  getDistricts(codeProvice: any){
    this.addressService.getDistricts().subscribe(data =>{
      this.districts = data.filter((item: any) => item.province_code == codeProvice.target.value);
    })
  }

  getWards(codeDist: any){
    console.log(codeDist.target.value)
    this.addressService.getWards().subscribe(data =>{
      this.wards = data.filter((item: any) => item.district_code == codeDist.target.value);
    })
  }

  onSubmit(){
    this.aboutService.saveInfo(this.about).subscribe(data =>{
      this.goToInfo();
    })
  }

  addMoreAddr(){
    let adBox = `<div class="row">
                                <div class="col-lg-4">
                                  <div class="contact-inner">
                                    <select (change)="getDistricts($event)" [(ngModel)]="provinceSelected" [ngModelOptions]="{standalone: true}">
                                      <option [value]="0" [selected]="true">Tỉnh thành</option>
                                      <option *ngFor="let p of provinces" [value]="p.code">{{p.name}}</option>
                                    </select>
                                  </div>
                                </div>
                                <div class="col-lg-4">
                                  <div class="contact-inner">
                                    <select (change)="getWards($event)" [(ngModel)]="distSelected" [ngModelOptions]="{standalone: true}">
                                      <option [value]="0" [selected]="true">Huyện</option>
                                      <option *ngFor="let d of districts" [value]="d.code">{{d.name}}</option>
                                    </select>
                                  </div>
                                </div>
                                <div class="col-lg-4">
                                  <div class="contact-inner">
                                    <select [(ngModel)]="wSelected" [ngModelOptions]="{standalone: true}">
                                      <option [value]="0" [selected]="true">Xã</option>
                                      <option *ngFor="let w of wards">{{w.name}}</option>
                                    </select>
                                  </div>
                                </div>
                                <div class="col-lg-4">
                                  <div class="contact-inner">
                                    <span><strong>Khu vực</strong></span>
                                    <input name="address" type="text">
                                  </div>
                                </div>
                                <div class="col-lg-8">
                                  <div class="contact-inner">
                                    <span><strong>ĐỊA CHỈ</strong></span>
                                    <input name="address" type="text">
                                  </div>
                                </div>
                              </div>
                              <div id="btn-box">
                                <button (click)="addMoreAddr()" class="ht-btn ht-btn-md mr-2">
                                  <i class="fa fa-save"></i>
                                  <span class="ml-2">Lưu</span>
                                </button>
                                <button (click)="removeChild($event)" class="ht-btn ht-btn-md ml-2" style="background: #ccc" type="button">Xóa</button>
                              </div>`
    // @ts-ignore
    document.getElementById("address").insertAdjacentHTML('beforeend', adBox);
  }

  removeChild(e: any){
    console.log(e.target);
    // document.getElementById("address").removeChild();
  }
}
