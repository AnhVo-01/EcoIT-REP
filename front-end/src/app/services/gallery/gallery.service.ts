import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Gallery} from "../../modules/typical/gallery/gallery";
import {Params} from "@angular/router";

@Injectable({
  providedIn: 'root'
})
export class GalleryService {
  private baseURL = `${Constant.BASE_URL}/s/tImage`;

  constructor(private httpClient: HttpClient) { }

  pageableList(param: Params): Observable<any>{
    return this.httpClient.get(`${this.baseURL}`, {params: param});
  }

  getAll(): Observable<Gallery[]>{
    return this.httpClient.get<Gallery[]>(`${this.baseURL}/home`);
  }

  getById(id: number): Observable<Gallery>{
    return this.httpClient.get<Gallery>(`${this.baseURL}/${id}`)
  }

  addNew(formData: FormData): Observable<any>{
    return this.httpClient.post(`${this.baseURL}`, formData);
  }

  addAlready(formData: FormData): Observable<any>{
    return this.httpClient.post(`${this.baseURL}/already`, formData);
  }

  addAlreadyById(id: number): Observable<any>{
    return this.httpClient.get(`${this.baseURL}/already/${id}`);
  }

  update(id: number, gallery: FormData): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/${id}`, gallery);
  }

  hide(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/hide/${id}`);
  }

  show(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/show/${id}`);
  }
}
