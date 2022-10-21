import { Component, OnInit } from '@angular/core';
import {Post} from "../post";
import {TokenStorageService} from "../../../services/token-storage/token-storage.service";
import {PostService} from "../../../services/post/post.service";
import {Router} from "@angular/router";
import {HttpParams} from "@angular/common/http";
import {FileService} from "../../../services/file/file.service";
import {DomSanitizer} from "@angular/platform-browser";

@Component({
  selector: 'app-post-control',
  templateUrl: './post-control.component.html',
  styleUrls: ['./post-control.component.css']
})
export class PostControlComponent implements OnInit {

  newsList: Post[] = [];
  totalPages: any;
  pageSizes = [3, 6, 9];

  url: any;
  roles: any;

  searchField = {
    pageIndex: 1,
    pageSize: 3,
    totalElements: 0,
    keyword: ''
  }

  constructor(private newsService: PostService, private tokenStorageService: TokenStorageService,
              private router: Router, private fileService: FileService) { }

  ngOnInit(): void {
    if(this.tokenStorageService.getToken()) {
      const user = this.tokenStorageService.getUser();
      this.roles = user.roles;

      this.getBySearch();

    }else{
      this.router.navigate(['/login']);
    }
  }

  getBySearch(){
    const params = new HttpParams()
      .set('pageNo', this.searchField.pageIndex)
      .set('pageSize', this.searchField.pageSize)
      .set('keyword', this.searchField.keyword);
    this.newsService.newsSearchList(params).subscribe(data => {
      this.newsList = data.content;
      this.searchField.totalElements = data.totalElements;
      this.totalPages = data.totalPages;
    });
  }

  search(){
    this.searchField.pageIndex = 1;
    this.getBySearch();
  }

  pageChanged(event: any){
    this.searchField.pageIndex = event;
    this.getBySearch();
  }

  changePageSize(psize: any) {
    this.searchField.pageSize = psize.target.value;
    this.searchField.pageIndex = 1;
    this.getBySearch();
  }

  updateNews(id: number){
    return this.router.navigate(['d/post/update', id]);
  }

  deleteNews(id: number){
    let option = confirm("Bài đăng này sẽ bị xóa bỏ. Tiếp tục?");

    if(option){
      this.newsService.deleteNews(id).subscribe(data =>{
        this.deleteControl();
      })
    }

  }

  deleteControl(){
    if(this.newsList.length-1 < 1 && this.searchField.pageIndex !== 1){
      this.searchField.pageIndex = this.searchField.pageIndex - 1;
    }
    this.getBySearch();
  }

  downloadImg(e: any){
    this.fileService.downloadFile(e).subscribe( data =>{
      this.getBySearch();
    })
  }

  deleteImg(e: any){
    var option = window.confirm("Bạn có chắc chắc sẽ xóa file này?")
    if(option === true){
      this.fileService.deleteFile(e[0]).subscribe( data =>{
        this.getBySearch();
      });
    }
  }

}
