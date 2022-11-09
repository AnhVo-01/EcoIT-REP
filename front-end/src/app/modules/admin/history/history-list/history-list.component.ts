import {Component, ElementRef, OnInit, QueryList, ViewChildren} from '@angular/core';
import {HttpParams} from "@angular/common/http";
import {HistoryService} from "../../../../services/history/history.service";
import {History} from "../history";
import {UserService} from "../../../../services/user/user.service";
import {User} from "../../../../core/model/user/user";

@Component({
  selector: 'app-history-list',
  templateUrl: './history-list.component.html',
  styleUrls: ['./history-list.component.css']
})
export class HistoryListComponent implements OnInit {

  histories: History[] = [];
  removeHistories: History[] = [];
  user: User[] = [];
  selects: any;
  isFilter = false;

  totalPages: any;
  pageSizes = [10, 20, 30];

  searchField = {
    pageIndex: 1,
    pageSize: 10,
    sortField: '',
    sortDir: '',
    totalElements: 0,
    method: '',
    executor: '',
    action: '',
    page: ''
  }

  constructor(private historyService: HistoryService, private userService: UserService) { }

  ngOnInit(): void {
    this.getBySearch();
    this.userService.getUserList().subscribe(data => {
      this.user = data;
    })
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
      .set('sortField', this.searchField.sortField)
      .set('sortDir', this.searchField.sortDir)
    this.historyService.getSearchList(params).subscribe(data => {
      this.histories = data.content;
      this.searchField.totalElements = data.totalElements;
      this.totalPages = data.totalPages;
    });
  }

  getByFilter(){
    const filter = new HttpParams()
      .set('pageNo', this.searchField.pageIndex)
      .set('pageSize', this.searchField.pageSize)
      .set('sortField', this.searchField.sortField)
      .set('sortDir', this.searchField.sortDir)
      .set('method', this.searchField.method)
      .set('executor', this.searchField.executor)
      .set('action', this.searchField.action)
      .set('page', this.searchField.page)
    this.historyService.getFilterList(filter).subscribe(data => {
      this.histories = data.content;
      this.searchField.totalElements = data.totalElements;
      this.totalPages = data.totalPages;
      this.isFilter = true;
    });
  }

  clearFilter(){
    this.isFilter = false;
    this.searchField.executor = '';
    this.searchField.action = '';
    this.searchField.method = '';
    this.searchField.page = '';
    this.getBySearch();
  }

  search(){
    this.searchField.pageIndex = 1;
    this.getBySearch();
  }

  searchDirection(e: any){
    this.searchField.sortDir = e;
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
      this.selects = null;
      this.listAll();
    })
  }

  @ViewChildren("checkboxes") checkboxes: QueryList<ElementRef> | undefined;
  uncheckAll() {
    // @ts-ignore
    this.checkboxes.forEach((element) => {
      element.nativeElement.checked = false;
    });
    this.selects = null;
  }

}
