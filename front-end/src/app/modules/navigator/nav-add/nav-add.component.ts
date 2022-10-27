import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from "@angular/router";
import {Navigator} from "../navigator";
import {NavigationService} from "../../../services/navigation/navigation.service";
import {NgbActiveModal} from "@ng-bootstrap/ng-bootstrap";

@Component({
  selector: 'app-nav-add',
  templateUrl: './nav-add.component.html',
  styleUrls: ['./nav-add.component.css']
})
export class NavAddComponent implements OnInit {

  id: any;
  group: any;
  isChild = false;
  nav: Navigator = new Navigator();
  navList: Navigator[] = [];
  navGroup: Navigator[] = [];
  navChild: Navigator[] = [];

  constructor(private navService: NavigationService,
              private route: ActivatedRoute,
              private modalService: NgbActiveModal) { }

  ngOnInit(): void {
    this.id = window.sessionStorage.getItem("navId");
    if(this.id){
      this.getNavById(this.id);
      this.getAllNavChild(this.id);
    }else{
      this.group = window.sessionStorage.getItem("navGroup");

      if (this.group != null){
        this.isChild = true;
        this.navService.getById(this.group).subscribe(data => {
          this.nav.parentId = data.id;
        });
      }else{
        this.isChild = false;
        this.getAllNavGroup();
      }
    }

  }

  getNavById(id: any) {
    this.navService.getById(id).subscribe(data => {
      this.nav = data;
    });
  }

  getAllNavChild(id: number){
    this.navService.getNavChild(id).subscribe(data => {
      this.navChild = data;
    })
  }

  getAllNavGroup(){
    this.navService.getNavGroup().subscribe(data => {
      this.navGroup = data;
    })
  }

  addNavigation(){
    this.navService.addNewNav(this.nav).subscribe(data =>{
      this.goToNavList();
    })
  }

  addChild(){
    // this.navService.addNewNav(this.nav).subscribe(data =>{
    //   this.getAllNavChild(this.group);
    // })
    console.log(this.group);
  }

  onSubmit(){
    if(this.id){
      this.navService.updateNav(this.id, this.nav).subscribe(data =>{
        this.goToNavList();
      })
    }else{
      this.addNavigation();
    }
  }


  goToNavList(){
    this.navService.getNavList().subscribe(data => {
      this.navList = data;
    })
    this.modalService.dismiss();
  }

  closeModal(){
    this.modalService.dismiss();
  }

}
