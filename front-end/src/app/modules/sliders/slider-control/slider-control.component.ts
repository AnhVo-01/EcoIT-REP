import { Component, OnInit } from '@angular/core';
import {CustomerService} from "../../../services/customer/customer.service";
import {TokenStorageService} from "../../../services/token-storage/token-storage.service";
import {Router} from "@angular/router";
import {HttpParams} from "@angular/common/http";
import {SliderService} from "../../../services/slider/slider.service";
import {Sliders} from "../sliders";

@Component({
  selector: 'app-slider-control',
  templateUrl: './slider-control.component.html',
  styleUrls: ['./slider-control.component.css']
})
export class SliderControlComponent implements OnInit {

  sliders: Sliders[] = [];
  target = {
    url: '',
    id: 1,
  };

  constructor(private sliderService: SliderService, private tokenStorageService: TokenStorageService, private router: Router) { }

  ngOnInit(): void {
    this.getCustomer();
  }

  getCustomer(){
    this.sliderService.getListAll().subscribe(data => {
      this.sliders = data
      this.target.url = this.sliders[0].pathUrl;
    });
  }

  choose(e: any){
    this.target.url = e.target.src;
    this.target.id = e.target.id;
  }

  updateSlider(id: number){
    return this.router.navigate(['admin/sliders/update', id]);
  }


  deleteCustomer(id: number){
    let option = confirm("Are you sure to delete");

    if(option == true){
      this.sliderService.hideSlider(id).subscribe(data =>{
        this.getCustomer();
      })
    }
  }

}
