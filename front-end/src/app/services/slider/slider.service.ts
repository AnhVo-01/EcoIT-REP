import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {Sliders} from "../../modules/sliders/sliders";

@Injectable({
  providedIn: 'root'
})
export class SliderService {
  private baseURL = `${Constant.BASE_URL}/s/sliders`;

  constructor(private httpClient: HttpClient) { }

  getListAll(): Observable<Sliders[]>{
    return this.httpClient.get<Sliders[]>(`${this.baseURL}`);
  }

  addNew(slider: FormData): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}`, slider);
  }

  getById(id: number): Observable<Sliders>{
    return this.httpClient.get<Sliders>(`${this.baseURL}/${id}`);
  }

  update(id: number, slider: FormData):Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/${id}`,slider);
  }

  hideSlider(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/delete/${id}`);
  }

  removeCustomer(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/remove/${id}`);
  }

  getTrashList(): Observable<Sliders[]>{
    return this.httpClient.get<Sliders[]>(`${this.baseURL}/recycle-bin`);
  }

  restoreItem(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/restore/${id}`);
  }
}
