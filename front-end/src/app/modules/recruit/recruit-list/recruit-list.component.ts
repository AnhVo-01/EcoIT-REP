import { Component, OnInit } from '@angular/core';
import {Recruit} from "../recruit";
import {RecruitService} from "../../../services/recruit/recruit.service";

@Component({
  selector: 'app-recruit-list',
  templateUrl: './recruit-list.component.html',
  styleUrls: ['./recruit-list.component.css']
})
export class RecruitListComponent implements OnInit {

  recruit: Recruit[] = [];

  constructor(private recruitService: RecruitService) { }

  ngOnInit(): void {
    let element = document.getElementById("myDIV");
    // @ts-ignore
    element.classList.add("bg-dark");

    this.getRecruitList();
  }

  getRecruitList(){
    this.recruitService.getRecruitList().subscribe(data =>{
      this.recruit = data;
    })
  }

}
