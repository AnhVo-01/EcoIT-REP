import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {Product} from "../../modules/product/product";

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private baseURL = `${Constant.BASE_URL}/s/product`;

  constructor(private httpClient: HttpClient) { }

  getProductList(): Observable<Product[]>{
    return this.httpClient.get<Product[]>(`${this.baseURL}/home`);
  }
  searchProductList(param: HttpParams): Observable<any>{
    return this.httpClient.get(`${this.baseURL}`, {params: param});
  }

  getProductById(id:number): Observable<Product>{
    return this.httpClient.get<Product>(`${this.baseURL}/d/${id}`);
  }

  getProductByUrl(url: string): Observable<Product>{
    return this.httpClient.get<Product>(`${this.baseURL}/${url}`);
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
