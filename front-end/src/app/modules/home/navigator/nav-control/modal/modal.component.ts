import {Component, OnInit, ViewChild} from '@angular/core';
import {NavigationService} from "../../../../../services/navigation/navigation.service";
import {Navigator} from "../../navigator";
import {ModalManager} from "ngb-modal";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-modal',
  templateUrl: './modal.component.html',
  styleUrls: ['./modal.component.css']
})
export class ModalComponent implements OnInit {

  nav: Navigator = new Navigator();
  navGroup: Navigator[] = [];
  id: any;
  group: any;

  constructor(private navService: NavigationService, private route: ActivatedRoute) {
    this.group = window.sessionStorage.getItem("navGroup");

  }

  ngOnInit(): void {
    this.id = this.route.snapshot.params['id'];
    if(this.id){
      this.getNavById(this.id);
    }else{
      this.addToGroup();
    }
  }

  addToGroup(){
    if (this.group != null){
      this.navService.getById(this.group).subscribe(data => {
        this.nav.parentId = data.id;
        console.log(data)
      });
    }
  }

  getNavById(id: any) {
    this.navService.getById(id).subscribe(data => {
      this.nav = data;
    });
  }

  getAllNavGroup(){
    this.navService.getNavGroup().subscribe(data => {
      this.navGroup = data;
    })
  }

  addNavigation(){
    this.navService.addNewNav(this.nav).subscribe(data =>{
      // this.getAllNav();
      window.location.reload();
    })
  }

  onSubmit(){
    this.addNavigation();
    window.sessionStorage.removeItem("navGroup");
  }

}
