import { Component, OnInit } from '@angular/core';
import {Post} from "../post";
import {ActivatedRoute} from "@angular/router";
import {TokenStorageService} from "../../../services/token-storage/token-storage.service";
import {PostService} from "../../../services/post/post.service";

@Component({
  selector: 'app-post-details',
  templateUrl: './post-details.component.html',
  styleUrls: ['./post-details.component.css']
})
export class PostDetailsComponent implements OnInit {

  url: any;
  paragraph: String[] = [];
  news: Post = new Post();

  roles: any;
  constructor(private route: ActivatedRoute, private newsService: PostService, private tokenStorageService: TokenStorageService) { }

  ngOnInit(): void {
    this.getList();
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      document.body.scrollTop = 0; // For Safari
      document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    }
    let element = document.getElementById("myDIV");
    // @ts-ignore
    element.classList.add("bg-dark");
  }

  getList(){
    this.url = this.route.snapshot.params['url'];
    this.newsService.getNewsByUrl(this.url).subscribe(data => {
      this.news = data;
      if(this.news.content != null){
        const str = this.news.content;
        this.paragraph = str.split("\n");
      }
      document.title = this.news.title;

    })
  }

}