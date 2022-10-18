import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class AddressService {

  constructor(private httpClient: HttpClient) { }

  getProvinces(): Observable<any>{
    return this.httpClient.get(`https://provinces.open-api.vn/api/p/`);
  }

  getDistricts(): Observable<any>{
    return this.httpClient.get(`https://provinces.open-api.vn/api/d/`);
  }

  getWards(): Observable<any>{
    return this.httpClient.get(`https://provinces.open-api.vn/api/w/`);
  }
}
