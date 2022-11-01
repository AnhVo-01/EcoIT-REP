import {Component, OnInit} from '@angular/core';
import {HttpParams} from "@angular/common/http";
import {Navigator} from "../navigator";
import {Router} from "@angular/router";
import {NavigationService} from "../../../services/navigation/navigation.service";
import {NgbModal} from "@ng-bootstrap/ng-bootstrap";
import {NgbModalRef} from "@ng-bootstrap/ng-bootstrap/modal/modal-ref";
import {NavAddComponent} from "../nav-add/nav-add.component";
import {ToastService} from "../../toast/toast.service";
import {ToastContainerComponent} from "../../toast/toast-container/toast-container.component";

@Component({
  selector: 'app-nav-control',
  templateUrl: './nav-control.component.html',
  styleUrls: ['./nav-control.component.css']
})
export class NavControlComponent implements OnInit {

  id: any;
  nav: Navigator = new Navigator();
  navList: Navigator[] = [];
  navChild: Navigator[] = [];

  totalPages: any;
  pageSizes = [20, 30, 40];

  searchField = {
    pageIndex: 1,
    pageSize: 20,
    totalElements: 0,
    keyword: ''
  }

  constructor(private navService: NavigationService, private router: Router,
              private modalService: NgbModal, private toast: ToastService) { }

  ngOnInit(): void {
    window.sessionStorage.removeItem("navGroup");
    window.sessionStorage.removeItem("navId");
    this.getAllNavGroup();
  }

  getAllNavGroup(){
    this.navService.getNavList().subscribe(data => {
      this.navList = data;
    })
  }

  getAllNav(){
    const params = new HttpParams()
      .set('pageNo', this.searchField.pageIndex)
      .set('pageSize', this.searchField.pageSize)
      .set('keyword', this.searchField.keyword);
    this.navService.searchNavList(params).subscribe(data => {
      this.navList = data.content;
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
    if(this.navList.length-1 < 1 && this.searchField.pageIndex !== 1){
      this.searchField.pageIndex = this.searchField.pageIndex - 1;
    }
    this.getAllNav()
  }

  deleteNav(id: number){
    let option = confirm("Bạn có chắc chắn xóa điều hướng này không?");

    if(option){
      this.navService.deleteNav(id).subscribe(data =>{
        this.toast.show("Xóa thành công!", { classname: 'bg-success text-light', delay: 10000 })
        // this.deleteControl();
      })
    }
  }

  modalRef?: NgbModalRef;

  openModal(e: any){
    this.modalRef = this.modalService.open(NavAddComponent, {
      size: "md",
      centered: false,
      backdrop: false,
      animation: true,
      backdropClass: "modal-backdrop"
    });
    this.modalRef.result.then(item => {
      if(item){
        this.getAllNavGroup();
      }
    })
    window.sessionStorage.setItem("navGroup", e.target.id)
  }

  updateModal(id: any){
    this.modalRef = this.modalService.open(NavAddComponent, {
      size: "md",
      centered: false,
      backdrop: false,
      animation: true,
      backdropClass: "modal-backdrop"
    });

    window.sessionStorage.setItem("navId", id)
  }
}
