import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {Sliders} from "../../modules/sliders/sliders";
import {Domain} from "../../core/domain/domain";

@Injectable({
  providedIn: 'root'
})
export class SliderService {
  private baseURL = `${Constant.BASE_URL}`;
  private domain = `${Domain.SLIDERS}`;

  constructor(private httpClient: HttpClient) { }

  getListAll(): Observable<Sliders[]>{
    return this.httpClient.get<Sliders[]>(`${this.baseURL}/home/${this.domain}`);
  }

  addNew(slider: FormData): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/${this.domain}`, slider);
  }

  getById(id: number): Observable<Sliders>{
    return this.httpClient.get<Sliders>(`${this.baseURL}/${this.domain}/${id}`);
  }

  update(id: number, slider: FormData):Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/${this.domain}/${id}`,slider);
  }

  hideSlider(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/${this.domain}/delete/${id}`);
  }

  removeCustomer(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/${this.domain}/remove/${id}`);
  }

  getTrashList(): Observable<Sliders[]>{
    return this.httpClient.get<Sliders[]>(`${this.baseURL}/${this.domain}/recycle-bin`);
  }

  restoreItem(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/${this.domain}/restore/${id}`);
  }
}
