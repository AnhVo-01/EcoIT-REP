import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {Post} from "../../modules/post/post";

@Injectable({
  providedIn: 'root'
})
export class PostService {

  private baseURL = `${Constant.BASE_URL}/s/news`;

  constructor(private httpClient: HttpClient) { }

  getNewsList(): Observable<Post[]>{
    return this.httpClient.get<Post[]>(`${this.baseURL}/home`)
  }

  createNews(news: FormData): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}`, news);
  }

  getNewsById(id: number): Observable<Post>{
    return this.httpClient.get<Post>(`${this.baseURL}/d/${id}`);
  }

  getNewsByUrl(url: string): Observable<Post>{
    return this.httpClient.get<Post>(`${this.baseURL}/${url}`);
  }

  updateNews(id: number, post: FormData):Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/${id}`,post);
  }

  deleteNews(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/delete/${id}`);
  }

  removeNews(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/remove/${id}`);
  }

  newsSearchList(param: HttpParams): Observable<any>{
    return this.httpClient.get(`${this.baseURL}`,{params: param})
  }
}
