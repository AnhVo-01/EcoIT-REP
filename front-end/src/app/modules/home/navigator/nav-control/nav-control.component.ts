import {Component, OnInit, ViewChild} from '@angular/core';
import {TokenStorageService} from "../../../../services/token-storage/token-storage.service";
import {HttpParams} from "@angular/common/http";
import {NavigationService} from "../../../../services/navigation/navigation.service";
import {Navigator} from "../navigator";
import {ModalManager} from "ngb-modal";
import {ModalComponent} from "./modal/modal.component";
import {Router} from "@angular/router";

@Component({
  selector: 'app-nav-control',
  templateUrl: './nav-control.component.html',
  styleUrls: ['./nav-control.component.css']
})
export class NavControlComponent implements OnInit {

  id: any;
  nav: Navigator = new Navigator();
  navParent: Navigator[] = [];
  navChild: Navigator[] = [];

  totalPages: any;
  pageSizes = [4, 8, 12];

  searchField = {
    pageIndex: 1,
    pageSize: 4,
    totalElements: 0,
    keyword: ''
  }

  constructor(private navService: NavigationService,
              private router: Router,
              private tokenStorageService: TokenStorageService) { }

  ngOnInit(): void {
    this.getAllNav()

    // @ts-ignore
    document.getElementById("active-nav").classList.add("here");
    // @ts-ignore
    document.getElementById("h-act-p").classList.add("here");
  }

  getAllNav(){
    const params = new HttpParams()
      .set('pageNo', this.searchField.pageIndex)
      .set('pageSize', this.searchField.pageSize)
      .set('keyword', this.searchField.keyword);
    this.navService.searchNavList(params).subscribe(data => {
      this.navParent = data.content;
      this.searchField.totalElements = data.totalElements;
      this.totalPages = data.totalPages;
    });
  }

  getAllNavChild(id: number){
    this.navService.getNavChild(id).subscribe(data => {
      this.navChild = data;
    })
  }

  search(){
    this.searchField.pageIndex = 1;
    this.getAllNav();
  }

  pageChanged(event: any){
    this.searchField.pageIndex = event;
    this.getAllNav();
  }

  changePageSize(event: any) {
    this.searchField.pageSize = event.target.value;
    this.searchField.pageIndex = 1;
    this.getAllNav();
  }

  deleteControl(){
    if(this.navParent.length-1 < 1){
      if(this.searchField.pageIndex !== 1){
        this.searchField.pageIndex = this.searchField.pageIndex - 1;
      }
    }
    this.getAllNav()
  }

  deleteNav(id: number){
    let option = confirm("Bạn có chắc chắn xóa điều hướng này không?");

    if(option){
      this.navService.deleteNav(id).subscribe(data =>{
        this.deleteControl();
      })
    }
  }

  openModal(e: any){
    // this.router.navigate(['update/:id'])
    e.target.setAttribute("data-toggle", "modal")
    e.target.setAttribute("data-target", "#myModal")
    window.sessionStorage.setItem("navGroup", e.target.id)
  }

}
