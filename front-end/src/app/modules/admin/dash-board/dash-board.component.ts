import { Component, OnInit } from '@angular/core';
import {Router} from "@angular/router";
import {TokenStorageService} from "../../../services/token-storage/token-storage.service";

@Component({
  selector: 'app-dash-board',
  templateUrl: './dash-board.component.html',
  styleUrls: ['./dash-board.component.css']
})
export class DashBoardComponent implements OnInit {

  private roles: any;
  isLogIn = false;
  username: any;

  constructor(private tokenStorageService: TokenStorageService, private router: Router) { }

  ngOnInit(): void {
    this.isLogIn = !!this.tokenStorageService.getToken();

    if(this.isLogIn){
      const user = this.tokenStorageService.getUser();
      this.username = user.username;
      this.roles = user.roles;

      if(this.roles.includes("ROLE_USER")){
        this.router.navigate(['/login']);
      }

    }else {
      this.router.navigate(['/login']);
    }
  }

  // newsList(): void{
  //   this.router.navigate(['/d/news']);
  // }
  //
  // listCustomer(){
  //   this.router.navigate(['/d/customer']);
  // }


}
