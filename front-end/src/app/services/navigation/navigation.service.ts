import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {Product} from "../../modules/product/product";

@Injectable({
  providedIn: 'root'
})
export class NavigationService {

  private baseURL = `${Constant.BASE_URL}/s/nav`;

  constructor(private httpClient: HttpClient) { }

  getNavList(): Observable<Navigator[]>{
    return this.httpClient.get<Navigator[]>(`${this.baseURL}/home`);
  }

  getNavChild(id: number): Observable<Navigator[]>{
    return this.httpClient.get<Navigator[]>(`${this.baseURL}/all/${id}`);
  }

  searchNavList(param: HttpParams): Observable<any>{
    return this.httpClient.get(`${this.baseURL}/all`, {params: param});
  }

  getById(id:number): Observable<Product>{
    return this.httpClient.get<Product>(`${this.baseURL}/${id}`);
  }

  addNewProduct(newProduct: FormData): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}`, newProduct);
  }

  updateProduct(id: number, product: FormData): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/${id}`, product);
  }

  deleteProduct(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/remove/${id}`);
  }
}
