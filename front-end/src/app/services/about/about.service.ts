import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {About} from "../../modules/about/about";

@Injectable({
  providedIn: 'root'
})
export class AboutService {

  private baseURL = `${Constant.BASE_URL}/s/about-us`;

  constructor(private httpClient: HttpClient) { }

  getInfo(): Observable<About>{
    return this.httpClient.get<About>(`${this.baseURL}`);
  }

  saveInfo(about: About): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}`, about);
  }
}
