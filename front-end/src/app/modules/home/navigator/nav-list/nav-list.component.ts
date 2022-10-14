import { Component, OnInit } from '@angular/core';
import {TokenStorageService} from "../../../../services/token-storage/token-storage.service";
import {Navigator} from "../navigator";
import {HttpParams} from "@angular/common/http";
import {NavigationService} from "../../../../services/navigation/navigation.service";

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

  constructor(private navService: NavigationService ,private tokenStorageService: TokenStorageService) { }

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

  logout(): void {
    this.tokenStorageService.signOut();
    window.location.reload();
  }

}
