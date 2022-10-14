import { Component, OnInit } from '@angular/core';
import {AboutService} from "../../../services/about/about.service";

@Component({
  selector: 'app-about-home',
  templateUrl: './about-home.component.html',
  styleUrls: ['./about-home.component.css']
})
export class AboutHomeComponent implements OnInit {

  paragraph: String[] = [];
  abouts: any;
  url: any;

  constructor(private aboutService: AboutService) { }

  ngOnInit(): void {
    this.getList();
  }

  getList(){
    this.aboutService.getInfo().subscribe(data => {
      this.abouts = data;
      if(this.abouts.description != null){
        const str = this.abouts.description;
        this.paragraph = str.split("&nbsp");
      }
      document.title = "VỀ CHÚNG TÔI";
      this.url = this.abouts.videoLINK;
    })
  }

}
