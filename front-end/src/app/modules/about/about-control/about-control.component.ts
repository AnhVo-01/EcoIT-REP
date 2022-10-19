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
  address: Address = new Address();
  // addList: Address[] = [];

  provinces: any;
  districts: any;
  wards: any;
  fullAddress: String[] =[];

  ckeConfig: any;
  submitFail = false;
  errorMessage = "";

  constructor(private aboutService: AboutService, private addressService: AddressService, private sanitizer: DomSanitizer) { }

  ngOnInit(): void {

    this.goToInfo();

    this.addressService.getProvinces().subscribe(data =>{
      this.provinces = data;
    })

    this.defaultAddrCode();

    this.ckeConfig = {
      extraPlugins: 'uploadimage, justify, colorbutton, colordialog, iframe, font',
      uploadUrl: 'https://ckeditor.com/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json',
      height: 330,
      filebrowserUploadUrl:'https://ckeditor.com/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Files',
      filebrowserImageUploadUrl:'https://ckeditor.com/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Images',

    };
  }

  defaultAddrCode(){
    this.address.province = 0;
    this.address.district = 0;
    this.address.wards = 0;
  }

  goToInfo(){
    this.aboutService.getInfo().subscribe(data =>{
      if(data != null){
        this.about = data;
      }
    })
    this.getListAddress();
  }

  getListAddress(){
    this.addressService.getListAddr().subscribe(data =>{
      for (let i=0; i<data.length; i++){
        if(data[i].address != null){
          this.fullAddress[i] = data[i].address;
        }
        if (data[i].wards != null){
          this.fullAddress[i] = this.fullAddress[i] + ", " + data[i].wards;
        }
        if (data[i].district != null){
          this.fullAddress[i] = this.fullAddress[i] + ", " + data[i].district;
        }
        if (data[i].province != null){
          this.fullAddress[i] = this.fullAddress[i] + ", " + data[i].province;
        }
      }
    })
  }

  getDistricts(codeProvice: any){
    this.addressService.getDistricts().subscribe(data =>{
      this.districts = data.filter((item: any) => item.province_code == codeProvice.target.value);
    })
  }

  getWards(codeDist: any){
    this.addressService.getWards().subscribe(data =>{
      this.wards = data.filter((item: any) => item.district_code == codeDist.target.value);
    })
  }

  onSubmit(){
    // for (let i=0; i<this.addList.length; i++){
    //   this.about.address[i] = this.addList[i];
    // }
    this.aboutService.saveInfo(this.about).subscribe(data =>{
      this.goToInfo();
    })
  }

  save(e: any){
    this.addressService.getProvincesByCode(this.address.province).subscribe(data =>{
      this.address.province = data.name;
    })
    this.addressService.getDistrictsByCode(this.address.district).subscribe(data =>{
      this.address.district = data.name;
    })

    this.addressService.createAddr(this.address).subscribe( data =>{
      this.submitFail = false;
      this.goToInfo();
    },err => {
      this.errorMessage = err.error.message;
      this.submitFail = true;
    })

    if (this.submitFail){
      e.target.setAttribute("data-dismiss", "modal");
    }
  }
}
