import {Component, Input, OnInit} from '@angular/core';
import {Navigator} from "../navigator/navigator";
import {NgbModalRef} from "@ng-bootstrap/ng-bootstrap/modal/modal-ref";

@Component({
  selector: 'app-modal',
  templateUrl: './modal.component.html',
  styleUrls: ['./modal.component.css']
})
  export class ModalComponent implements OnInit {

  @Input() data: any;
  modalRef?: NgbModalRef;

  isChild = false;
  nav: Navigator = new Navigator();
  navGroup: Navigator[] = [];

  constructor() { }

  ngOnInit(): void {
  }

  onSubmit(){
    console.log()
  }

  closeModal(){
    this.modalRef?.close();
  }
}
