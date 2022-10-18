import { Component, OnInit } from '@angular/core';
import {Post} from "../../post/post";
import {PostService} from "../../../services/post/post.service";
import {AboutService} from "../../../services/about/about.service";
import {About} from "../../about/about";

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.css']
})
export class FooterComponent implements OnInit {

  post: Post[] = [];
  about: About = new About();

  constructor(private postService: PostService, private aboutService: AboutService) { }

  ngOnInit(): void {
    this.postService.getNewsList().subscribe(data=>{
      this.post = data;
    })
    this.aboutService.getInfo().subscribe(data =>{
      this.about = data;
    })
  }

}
