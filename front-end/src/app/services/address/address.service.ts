import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Constant} from "../../core/config/constant";
import {Address} from "../../modules/address/address";

@Injectable({
  providedIn: 'root'
})
export class AddressService {

  private baseURL = `${Constant.BASE_URL}/s/address`;

  constructor(private httpClient: HttpClient) { }

  getProvinces(): Observable<any>{
    return this.httpClient.get(`https://provinces.open-api.vn/api/p/`);
  }

  getProvincesByCode(code: number): Observable<any>{
    return this.httpClient.get(`https://provinces.open-api.vn/api/p/${code}`);
  }

  getDistricts(): Observable<any>{
    return this.httpClient.get(`https://provinces.open-api.vn/api/d/`);
  }

  getDistrictsByCode(code: number): Observable<any>{
    return this.httpClient.get(`https://provinces.open-api.vn/api/d/${code}`);
  }

  getWards(): Observable<any>{
    return this.httpClient.get(`https://provinces.open-api.vn/api/w/`);
  }

  createAddr(address: Address): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}`, address);
  }

  getListAddr(): Observable<Address[]>{
    return this.httpClient.get<Address[]>(`${this.baseURL}/all`);
  }

  getAllActive(): Observable<Address[]>{
    return this.httpClient.get<Address[]>(`${this.baseURL}`);
  }
}
