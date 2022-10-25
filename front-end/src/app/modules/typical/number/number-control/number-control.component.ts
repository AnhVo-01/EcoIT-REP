import { Component, OnInit } from '@angular/core';
import {NumberService} from "../../../../services/number-typical/number.service";
import {Router} from "@angular/router";
import {Number} from "../number";

@Component({
  selector: 'app-number-control',
  templateUrl: './number-control.component.html',
  styleUrls: ['./number-control.component.css']
})
export class NumberControlComponent implements OnInit {

  numbers: Number[] = [];

  constructor(private numberService: NumberService, private router: Router) { }

  ngOnInit(): void {
    this.ListNumber();
  }

  ListNumber(){
    this.numberService.getAllNumber().subscribe(data => {
      this.numbers = data;
    })
  }

  addTypicalNum(){
    this.router.navigate(['/d/typical-number/new']);
  }

  updateTypicalNum(id: number){
    this.router.navigate([`/d/typical-number/update/${id}`]);
  }

  deleteElement(id: number){
    let option = confirm("Dữ liệu sẽ bị xóa. Bạn có muốn tiếp tục?");

    if(option == true){
      this.numberService.deleteTypicalNum(id).subscribe(data =>{
        this.ListNumber();
      })
    }
  }

}
