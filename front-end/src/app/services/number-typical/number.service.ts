import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Number} from "../../modules/typical/number/number";

@Injectable({
  providedIn: 'root'
})
export class NumberService {

  private baseURL = `${Constant.BASE_URL}/s/number`;

  constructor(private httpClient: HttpClient) { }

  getAllNumber(): Observable<Number[]>{
    return this.httpClient.get<Number[]>(`${this.baseURL}`);
  }

  getById(id: number): Observable<Number>{
    return this.httpClient.get<Number>(`${this.baseURL}/${id}`);
  }

  createNumber(number: Number): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}`, number);
  }

  updateTypicalNum(id: number, number: Number): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/${id}`, number);
  }

  deleteTypicalNum(id: number): Observable<any>{
    return this.httpClient.get(`${this.baseURL}/delete/${id}`);
  }
}
