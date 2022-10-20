import { Component, OnInit } from '@angular/core';
import {PostService} from "../../../services/post/post.service";

@Component({
  selector: 'app-post-list',
  templateUrl: './post-list.component.html',
  styleUrls: ['./post-list.component.css']
})
export class PostListComponent implements OnInit {

  news: any;
  url: any;

  constructor(private newsService: PostService) { }

  ngOnInit(): void {
    this.getNews();
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      document.body.scrollTop = 0; // For Safari
      document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    }
  }

  private getNews(){
    this.newsService.getNewsList().subscribe(data => {
      this.news = data;
      this.url = this.news[0].postImage.url;
      document.title = "TIN MỚI NHẤT - Công ty cổ phần EcoIT";

      var element = document.getElementById("myDIV");
      // @ts-ignore
      element.classList.add("bg-dark");
    })
  }

}
