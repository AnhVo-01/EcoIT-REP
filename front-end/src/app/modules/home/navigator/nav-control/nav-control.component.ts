import { Component, OnInit } from '@angular/core';
import {Product} from "../../../product/product";
import {ProductService} from "../../../../services/product/product.service";
import {Router} from "@angular/router";
import {FileService} from "../../../../services/file/file.service";
import {TokenStorageService} from "../../../../services/token-storage/token-storage.service";
import {HttpParams} from "@angular/common/http";
import {Navigator} from "../navigator";
import {NavigationService} from "../../../../services/navigation/navigation.service";

@Component({
  selector: 'app-nav-control',
  templateUrl: './nav-control.component.html',
  styleUrls: ['./nav-control.component.css']
})
export class NavControlComponent implements OnInit {

  id: any;
  nav: Navigator[] = [];
  totalPages: any;
  pageSizes = [4, 8, 12];

  searchField = {
    pageIndex: 1,
    pageSize: 4,
    totalElements: 0,
    keyword: ''
  }

  constructor(private navService: NavigationService,
              private router: Router, private fileService: FileService,
              private tokenStorageService: TokenStorageService) { }

  ngOnInit(): void {
    this.getProduct()
    // @ts-ignore
    document.getElementById("active-nav").classList.add("here");
    // @ts-ignore
    document.getElementById("h-act-p").classList.add("here");
  }

  getProduct(){
    const params = new HttpParams()
      .set('pageNo', this.searchField.pageIndex)
      .set('pageSize', this.searchField.pageSize)
      .set('keyword', this.searchField.keyword);
    this.navService.searchNavList(params).subscribe(data => {
      this.nav = data.content;
      this.searchField.totalElements = data.totalElements;
      this.totalPages = data.totalPages;
    });
  }

  search(){
    this.searchField.pageIndex = 1;
    this.getProduct();
  }

  pageChanged(event: any){
    this.searchField.pageIndex = event;
    this.getProduct();
  }

  changePageSize(event: any) {
    this.searchField.pageSize = event.target.value;
    this.searchField.pageIndex = 1;
    this.getProduct();
  }

}
