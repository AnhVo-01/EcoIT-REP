import { Component, OnInit } from '@angular/core';
import {Post} from "../../../core/model/post/post";
import {PostService} from "../../../services/post/post.service";
import {AboutService} from "../../../services/about/about.service";
import {About} from "../../../core/model/about/about";
import {AddressService} from "../../../services/address/address.service";

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.css']
})
export class FooterComponent implements OnInit {

  post: Post[] = [];
  about: About = new About();

  fullAddress: String[] =[];

  constructor(private postService: PostService, private aboutService: AboutService, private addressService: AddressService) { }

  ngOnInit(): void {
    this.postService.getNewsList().subscribe(data=>{
      this.post = data;
    })
    this.aboutService.getInfo().subscribe(data =>{
      if (data != null){
        this.about = data;
        this.getListAddress(this.about)
      }
    })
  }

  getListAddress(about: About) {
    for (let i = 0; i < about.address.length; i++) {
      if (about.address[i].prefix != null) {
        this.fullAddress[i] = about.address[i].prefix + ": ";
      }
      if (about.address[i].address != null) {
        this.fullAddress[i] = this.fullAddress[i] + about.address[i].address;
      }
      if (about.address[i].wards != null) {
        this.fullAddress[i] = this.fullAddress[i] + ", " + about.address[i].wards;
      }
      if (about.address[i].district != null) {
        this.addressService.getDistrictsByCode(about.address[i].district).subscribe(district => {
          this.fullAddress[i] = this.fullAddress[i] + ", " + district.name;
        })
      }
      if (about.address[i].province != null) {
        this.addressService.getProvincesByCode(about.address[i].province).subscribe(province => {
          this.fullAddress[i] = this.fullAddress[i] + ", " + province.name;
        })
      }
    }
  }

}
