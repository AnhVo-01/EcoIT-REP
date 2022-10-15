import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import {Navigator} from "../navigator";
import {NavigationService} from "../../../../services/navigation/navigation.service";

@Component({
  selector: 'app-nav-add',
  templateUrl: './nav-add.component.html',
  styleUrls: ['./nav-add.component.css']
})
export class NavAddComponent implements OnInit {

  id: any;
  nav: Navigator = new Navigator();
  navGroup: Navigator[] = [];
  navChild: Navigator[] = [];

  constructor(private navService: NavigationService,
              private router: Router,
              private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.id = this.route.snapshot.params['id'];
    if(this.id){
      this.getNavById(this.id);
      this.getAllNavChild(this.id);
    }

    this.getAllNavGroup();
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

  onSubmit(){
    if(this.id){
      this.updateNav(this.id);
    }else{
      this.addNavigation();
    }
  }

  updateNav(id: any){
    this.navService.updateNav(id, this.nav).subscribe(data =>{
      this.goToNavList();
    })
  }

  goToNavList(){
    this.router.navigate(['/d/navigation']);
  }

}
