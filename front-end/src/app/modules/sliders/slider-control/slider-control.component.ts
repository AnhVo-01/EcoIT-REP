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

  day: any;
  today: any;
  month: any;
  target = {
    url: '',
    id: 1,
  };

  constructor(private sliderService: SliderService, private tokenStorageService: TokenStorageService, private router: Router) { }

  ngOnInit(): void {
    // @ts-ignore
    document.getElementById("active-sl").classList.add("here");
    // @ts-ignore
    document.getElementById("h-act-c").classList.add("here");
    this.getCustomer();
    this.calendarHome();
  }

  getCustomer(){
    this.sliderService.getListAll().subscribe(data => {
      this.sliders = data
      this.target.url = this.sliders[0].pathUrl;
    });
  }

  calendarHome(){
    const weekday = ["CN","TH 2","TH 3","TH 4","TH 5","TH 6","TH 7"];

    const d = new Date();
    this.day = weekday[d.getDay()];
    this.today = d.getDate();
    this.month = d.getMonth()+1;
  }

  choose(e: any){
    this.target.url = e.target.src;
    this.target.id = e.target.id;
  }

  updateSlider(id: number){
    return this.router.navigate(['d/sliders/update', id]);
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
