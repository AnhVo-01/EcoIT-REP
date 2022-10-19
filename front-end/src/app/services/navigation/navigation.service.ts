import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {Navigator} from "../../modules/home/navigator/navigator";

@Injectable({
  providedIn: 'root'
})
export class NavigationService {

  private baseURL = `${Constant.BASE_URL}/s/nav`;

  constructor(private httpClient: HttpClient) { }

  getNavList(): Observable<Navigator[]>{
    return this.httpClient.get<Navigator[]>(`${this.baseURL}/home`);
  }

  getNavGroup(): Observable<Navigator[]>{
    return this.httpClient.get<Navigator[]>(`${this.baseURL}/group`);
  }

  getNavChild(id: number): Observable<Navigator[]>{
    return this.httpClient.get<Navigator[]>(`${this.baseURL}/all/${id}`);
  }

  searchNavList(param: HttpParams): Observable<any>{
    return this.httpClient.get(`${this.baseURL}/all`, {params: param});
  }

  getById(id:any): Observable<Navigator>{
    return this.httpClient.get<Navigator>(`${this.baseURL}/${id}`);
  }

  addNewNav(navigator: Navigator): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}`, navigator);
  }

  updateNav(id: number, navigator: Navigator): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/${id}`, navigator);
  }

  deleteNav(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/delete/${id}`);
  }
}
