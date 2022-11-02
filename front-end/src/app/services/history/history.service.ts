import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {History} from "../../modules/admin/history/history";

@Injectable({
  providedIn: 'root'
})
export class HistoryService {

  private baseURL = `${Constant.BASE_URL}/history`;

  constructor(private httpClient: HttpClient) { }

  getSearchList(param: HttpParams): Observable<any>{
    return this.httpClient.get(`${this.baseURL}`,{params: param})
  }

  getAllHistory(): Observable<History[]>{
    return this.httpClient.get<History[]>(`${this.baseURL}`);
  }

  deleteHistory(formData: FormData): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/delete`, formData);
  }
}
