import { Component, OnInit } from '@angular/core';
import {PostService} from "../../../../services/post/post.service";
import {RecruitService} from "../../../../services/recruit/recruit.service";

@Component({
  selector: 'app-recruit-post',
  templateUrl: './recruit-post.component.html',
  styleUrls: ['./recruit-post.component.css']
})
export class RecruitPostComponent implements OnInit {

  news: any;
  recruit: any

  constructor(private newsService: PostService, private recruitService: RecruitService) { }

  ngOnInit(): void {
    this.getNews();
    this.getRecruit();
  }

  private getNews(){
    this.newsService.getNewsList().subscribe(data => {
      this.news = data;
    })
  }

  private getRecruit(){
    this.recruitService.getRecruitList().subscribe(data => {
      this.recruit = data;
    })
  }

}
