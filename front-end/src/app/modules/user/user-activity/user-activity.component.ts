import { Component, OnInit } from '@angular/core';
import {NgbActiveModal} from "@ng-bootstrap/ng-bootstrap";

@Component({
  selector: 'app-user-activity',
  templateUrl: './user-activity.component.html',
  styleUrls: ['./user-activity.component.css']
})
export class UserActivityComponent implements OnInit {

  constructor(private modalService: NgbActiveModal) { }

  ngOnInit(): void {
  }

  closeModal(){
    window.sessionStorage.removeItem("UID");
    this.modalService.close();
  }
}
