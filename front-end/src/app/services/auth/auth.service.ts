import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {User} from "../../modules/user/user";

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private baseURL = "http://localhost:8080/auth";

  constructor(private httpClient: HttpClient) { }

  login(user: User): Observable<Object> {
    return this.httpClient.post(`${this.baseURL}/login`, user);
  }

  register(user: User): Observable<Object> {
    return this.httpClient.post(`${this.baseURL}/register`, user);
  }
}
