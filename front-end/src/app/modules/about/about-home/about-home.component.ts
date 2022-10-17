import { Component, OnInit } from '@angular/core';
import {AboutService} from "../../../services/about/about.service";
import {About} from "../about";
import {DomSanitizer} from "@angular/platform-browser";

@Component({
  selector: 'app-about-home',
  templateUrl: './about-home.component.html',
  styleUrls: ['./about-home.component.css']
})
export class AboutHomeComponent implements OnInit {

  paragraph: String[] = [];
  abouts: About = new About();
  link: any;

  constructor(private aboutService: AboutService, private sanitizer: DomSanitizer) { }

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
    })
  }
}
