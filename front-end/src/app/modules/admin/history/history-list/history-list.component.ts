import { Component, OnInit } from '@angular/core';
import {HttpParams} from "@angular/common/http";
import {HistoryService} from "../../../../services/history/history.service";
import {History} from "../history";
import {Customer} from "../../../customer/customer";
import {Product} from "../../../product/product";

@Component({
  selector: 'app-history-list',
  templateUrl: './history-list.component.html',
  styleUrls: ['./history-list.component.css']
})
export class HistoryListComponent implements OnInit {

  histories: History[] = [];
  removeHistories: History[] = [];
  selects: any;

  totalPages: any;
  pageSizes = [10, 20, 30];

  searchField = {
    pageIndex: 1,
    pageSize: 20,
    totalElements: 0,
    keyword: ''
  }

  constructor(private historyService: HistoryService) { }

  ngOnInit(): void {
    this.listAll();
  }

  listAll(){
    this.historyService.getAllHistory().subscribe(data =>{
      this.histories = data;
    })
  }

  getBySearch(){
    const params = new HttpParams()
      .set('pageNo', this.searchField.pageIndex)
      .set('pageSize', this.searchField.pageSize)
      .set('keyword', this.searchField.keyword);
    this.historyService.getSearchList(params).subscribe(data => {
      this.histories = data.content;
      this.searchField.totalElements = data.totalElements;
      this.totalPages = data.totalPages;
    });
  }

  search(){
    this.searchField.pageIndex = 1;
    this.getBySearch();
  }

  pageChanged(event: any){
    this.searchField.pageIndex = event;
    this.getBySearch();
  }

  changePageSize(psize: any) {
    this.searchField.pageSize = psize.target.value;
    this.searchField.pageIndex = 1;
    this.getBySearch();
  }

  onCheckChange(event: any, history: History){
    history.selected = event.currentTarget.checked;
    this.selects = this.histories.filter(item => item.selected).length;
  }

  prepareFormData(ids: any): FormData {
    const  formData = new FormData();
    formData.append(
      'id',
      new Blob([JSON.stringify(ids)], {type: 'application/json'})
    )

    return formData;
  }

  clearLog(){
    this.removeHistories = this.histories.filter(item => item.selected)
    const formDATA = this.prepareFormData(this.removeHistories.map(id => id.id));
    this.historyService.deleteHistory(formDATA).subscribe(() => {
      console.log("delete successfully!")
      this.listAll();
    })
  }

}
