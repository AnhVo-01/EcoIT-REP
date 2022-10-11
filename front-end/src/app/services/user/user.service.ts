import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private baseURL = "http://localhost:8080/auth";

  constructor(private http: HttpClient) { }

  getPublicContent(): Observable<Object>{
    return this.http.get(`${this.baseURL}/all`, {responseType: 'text'});
  }

  getUserBoard(): Observable<any> {
    return this.http.get(`${this.baseURL}/user`, {responseType: 'text'});
  }

  getModeratorBoard(): Observable<any>{
    return this.http.get(`${this.baseURL}/mod`, {responseType: 'text'});
  }

  getAdminBoard(): Observable<any>{
    return this.http.get(`${this.baseURL}/admin`, {responseType: 'text'});
  }
}
