import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {Constant} from "../../core/config/constant";
import {User} from "../../modules/user/user";

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private baseURL = `${Constant.BASE_URL}/user`;

  constructor(private httpClient: HttpClient) { }

  getSearchList(param: HttpParams): Observable<any>{
    return this.httpClient.get(`${this.baseURL}`,{params: param})
  }

  getUserById(id: number): Observable<User>{
    return this.httpClient.get<User>(`${this.baseURL}/${id}`);
  }

  getPublicContent(): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/all`, {responseType: 'text'});
  }

  getUserBoard(): Observable<any> {
    return this.httpClient.get(`${this.baseURL}/user`, {responseType: 'text'});
  }

  getModeratorBoard(): Observable<any>{
    return this.httpClient.get(`${this.baseURL}/mod`, {responseType: 'text'});
  }

  getAdminBoard(): Observable<any>{
    return this.httpClient.get(`${this.baseURL}/admin`, {responseType: 'text'});
  }
}
