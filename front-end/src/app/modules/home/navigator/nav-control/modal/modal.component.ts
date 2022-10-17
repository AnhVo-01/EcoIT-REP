import {Component, OnInit, ViewChild} from '@angular/core';
import {NavigationService} from "../../../../../services/navigation/navigation.service";
import {Navigator} from "../../navigator";
import {ModalManager} from "ngb-modal";

@Component({
  selector: 'app-modal',
  templateUrl: './modal.component.html',
  styleUrls: ['./modal.component.css']
})
export class ModalComponent implements OnInit {

  nav: Navigator = new Navigator();
  navGroup: Navigator[] = [];

  constructor(private navService: NavigationService, private modalService: ModalManager) { }

  ngOnInit(): void {
    this.getAllNavGroup();
  }

  getAllNavGroup(){
    this.navService.getNavGroup().subscribe(data => {
      this.navGroup = data;
    })
  }

  addNavigation(){
    this.navService.addNewNav(this.nav).subscribe(data =>{
      // this.getAllNav();
      window.location.reload();
    })
  }

  onSubmit(){
    this.addNavigation();
  }

  @ViewChild('myModal') myModal: any;
  private modalRef: any;

  // openModal(){
  //   this.modalRef = this.modalService.open(this.myModal, {
  //     size: "md",
  //     modalClass: 'mymodal',
  //     hideCloseButton: false,
  //     centered: false,
  //     backdrop: true,
  //     animation: true,
  //     keyboard: false,
  //     closeOnOutsideClick: true,
  //     backdropClass: "modal-backdrop"
  //   })
  // }
  closeModal(){
    this.modalService.close(this.modalRef);
    //or this.modalRef.close();
  }

}
