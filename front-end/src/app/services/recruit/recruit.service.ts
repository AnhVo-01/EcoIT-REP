import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Recruit} from "../../modules/recruit/recruit";

@Injectable({
  providedIn: 'root'
})
export class RecruitService {

  private baseURL = `${Constant.BASE_URL}/s/recruit`;

  constructor(private httpClient: HttpClient) { }

  getRecruitList(): Observable<Recruit[]>{
    return this.httpClient.get<Recruit[]>(`${this.baseURL}/home`);
  }

  addRecruit(recruit: FormData): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}`, recruit);
  }

  deleteRecruit(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/delete/${id}`);
  }
}
