import { Component, OnInit } from '@angular/core';
import {NgbActiveModal} from "@ng-bootstrap/ng-bootstrap";

@Component({
  selector: 'app-user-add',
  templateUrl: './user-add.component.html',
  styleUrls: ['./user-add.component.css']
})
export class UserAddComponent implements OnInit {

  constructor(private modalService: NgbActiveModal) { }

  ngOnInit(): void {
  }

  onSubmit(){}

  closeModal(){
    this.modalService.close();
  }

}
