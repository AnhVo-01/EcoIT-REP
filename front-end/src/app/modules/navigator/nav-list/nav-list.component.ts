import { Component, OnInit } from '@angular/core';
import {TokenStorageService} from "../../../services/token-storage/token-storage.service";
import {Navigator} from "../navigator";
import {About} from "../../about/about";
import {AboutService} from "../../../services/about/about.service";
import {NavigationService} from "../../../services/navigation/navigation.service";

@Component({
  selector: 'app-nav-list',
  templateUrl: './nav-list.component.html',
  styleUrls: ['./nav-list.component.css']
})
export class NavListComponent implements OnInit {

  private roles: any;
  isLoggedIn = false;
  showAdminBoard = false;
  showModeratorBoard = false;
  username: any;

  navParent: Navigator[] = [];
  navChild: Navigator[] = [];

  about: About = new About();

  constructor(private navService: NavigationService,
              private aboutService: AboutService,
              private tokenStorageService: TokenStorageService) { }

  ngOnInit(): void {
    this.isLoggedIn = !!this.tokenStorageService.getToken();

    if(this.isLoggedIn){
      const user = this.tokenStorageService.getUser();
      this.roles = user.roles;

      this.showAdminBoard = this.roles.includes("ROLE_ADMIN");
      this.showModeratorBoard = this.roles.includes("ROLE_MODERATOR");

      this.username = user.username;
    }

    this.getAllNav();
    this.getAbout();

    let element = document.getElementById("myDIV");

    // if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
    //   // @ts-ignore
    //   element.classList.add("is-sticky");
    // }else{
    //   // @ts-ignore
    //   element.classList.remove("is-sticky");
    // }

  }

  getAllNav(){
    this.navService.getNavList().subscribe(data => {
      this.navParent = data;
    });
  }

  getAllNavChild(id: number){
    this.navService.getNavChild(id).subscribe(data => {
      this.navChild = data;
    })
  }

  getAbout(){
    this.aboutService.getInfo().subscribe(data =>{
      if (data != null){
        this.about = data;
      }
    })
  }
}
