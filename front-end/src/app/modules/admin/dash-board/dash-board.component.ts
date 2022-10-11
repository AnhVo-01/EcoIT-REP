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

  day: any;
  today: any;
  month: any;

  constructor(private tokenStorageService: TokenStorageService, private router: Router) { }

  ngOnInit(): void {
    this.isLogIn = !!this.tokenStorageService.getToken();

    if(this.isLogIn){
      const user = this.tokenStorageService.getUser();
      this.username = user.username;
      this.roles = user.roles;

      this.calendarHome();

      if(this.roles.includes("ROLE_USER")){
        this.router.navigate(['/login']);
      }

      // @ts-ignore
      document.getElementById("active-d").classList.add("here");
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

  calendarHome(){
    const weekday = ["CN","TH 2","TH 3","TH 4","TH 5","TH 6","TH 7"];

    const d = new Date();
    this.day = weekday[d.getDay()];
    this.today = d.getDate();
    this.month = d.getMonth()+1;
  }


}
