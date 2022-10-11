import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {Customer} from "../../modules/customer/customer";

@Injectable({
  providedIn: 'root'
})
export class CustomerService {

  private baseURL = `${Constant.BASE_URL}/s/customer`;

  constructor(private httpClient: HttpClient) { }

  getBySearch(param: HttpParams): Observable<any>{
    return this.httpClient.get(`${this.baseURL}`, {params: param});
  }
  getCustomerList(): Observable<Customer[]>{
    return this.httpClient.get<Customer[]>(`${this.baseURL}/home`);
  }

  newCustomer(customer: Customer): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}`, customer);
  }

  getCusById(id: number): Observable<Customer>{
    return this.httpClient.get<Customer>(`${this.baseURL}/${id}`);
  }

  updateCustomer(id: number, customer: Customer):Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/${id}`,customer);
  }

  deleteCustomer(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/delete/${id}`);
  }

  removeCustomer(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/remove/${id}`);
  }

  getTrashList(): Observable<Customer[]>{
    return this.httpClient.get<Customer[]>(`${this.baseURL}/recycle-bin`);
  }

  restoreItem(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/restore/${id}`);
  }
}
