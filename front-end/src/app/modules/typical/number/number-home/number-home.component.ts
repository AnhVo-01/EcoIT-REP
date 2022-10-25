import { Component, OnInit } from '@angular/core';
import {Number} from "../number";
import {NumberService} from "../../../../services/number-typical/number.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-number-home',
  templateUrl: './number-home.component.html',
  styleUrls: ['./number-home.component.css']
})
export class NumberHomeComponent implements OnInit {

  numbers: Number[] = [];

  constructor(private numberService: NumberService, private router: Router) { }

  ngOnInit(): void {
    this.numberService.getAllNumber().subscribe( data => {
      this.numbers = data;
    })
  }

}
