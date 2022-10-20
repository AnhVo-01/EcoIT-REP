import { Component, OnInit } from '@angular/core';
import {TokenStorageService} from "../../../services/token-storage/token-storage.service";

@Component({
  selector: 'app-aside',
  templateUrl: './aside.component.html',
  styleUrls: ['./aside.component.css']
})
export class AsideComponent implements OnInit {


  constructor(private tokenStorageService: TokenStorageService) { }

  ngOnInit(): void {
    const navAct = window.sessionStorage.getItem("ad-nav-active");

    // @ts-ignore
    // document.getElementById(navAct).classList.add("here");
  }

  logout(): void {
    this.tokenStorageService.signOut();
    window.location.reload();
  }
}
