import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class FileService {

  private baseURL = `${Constant.BASE_URL}/s/file`;

  constructor(private httpClient: HttpClient) { }

  downloadFile(file: File): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/downloadFile`,file, {observe: "response", responseType: "blob"});
  }

  deleteFile(file: File): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/deleteFile`, file);
  }
}
