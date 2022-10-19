import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {Recruit} from "../../modules/recruit/recruit";

@Injectable({
  providedIn: 'root'
})
export class RecruitService {

  private baseURL = `${Constant.BASE_URL}/s/recruit`;

  constructor(private httpClient: HttpClient) { }

  getBySearch(param: HttpParams): Observable<any>{
    return this.httpClient.get(`${this.baseURL}`, {params: param});
  }

  getRecruitList(): Observable<Recruit[]>{
    return this.httpClient.get<Recruit[]>(`${this.baseURL}/home`);
  }

  getById(id: number): Observable<any>{
    return this.httpClient.get(`${this.baseURL}/d/${id}`);
  }

  getDetails(url: string): Observable<any>{
    return this.httpClient.get(`${this.baseURL}/${url}`);
  }

  addRecruit(recruit: FormData): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}`, recruit);
  }

  updateRecruit(id: number, recruit: FormData): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/${id}`, recruit);
  }

  deleteRecruit(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/delete/${id}`);
  }
}
