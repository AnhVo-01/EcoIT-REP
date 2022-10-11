import { Component, OnInit } from '@angular/core';
import {TokenStorageService} from "../../../services/token-storage/token-storage.service";

@Component({
  selector: 'app-navigator',
  templateUrl: './navigator.component.html',
  styleUrls: ['./navigator.component.css']
})
export class NavigatorComponent implements OnInit {

  private roles: any;
  isLoggedIn = false;
  showAdminBoard = false;
  showModeratorBoard = false;
  username: any;

  constructor(private tokenStorageService: TokenStorageService) { }

  ngOnInit(): void {
    this.isLoggedIn = !!this.tokenStorageService.getToken();

    if(this.isLoggedIn){
      const user = this.tokenStorageService.getUser();
      this.roles = user.roles;

      this.showAdminBoard = this.roles.includes("ROLE_ADMIN");
      this.showModeratorBoard = this.roles.includes("ROLE_MODERATOR");

      this.username = user.username;
    }

  }

  logout(): void {
    this.tokenStorageService.signOut();
    window.location.reload();
  }

}
