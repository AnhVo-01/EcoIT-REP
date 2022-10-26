import { Injectable } from '@angular/core';
import {Constant} from "../../core/config/constant";
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {Blog} from "../../modules/blog/blog";

@Injectable({
  providedIn: 'root'
})
export class BlogService {

  private baseURL = `${Constant.BASE_URL}/s/blogs`;

  constructor(private httpClient: HttpClient) { }

  getSearchList(param: HttpParams): Observable<any>{
    return this.httpClient.get(`${this.baseURL}`,{params: param})
  }

  getBlogList(): Observable<Blog[]>{
    return this.httpClient.get<Blog[]>(`${this.baseURL}/home`)
  }

  getBlogById(id: number): Observable<Blog>{
    return this.httpClient.get<Blog>(`${this.baseURL}/d/${id}`);
  }

  getBlogByUrl(url: string): Observable<Blog>{
    return this.httpClient.get<Blog>(`${this.baseURL}/${url}`);
  }

  writeBlog(blog: FormData): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}`, blog);
  }

  updateBlog(id: number, blog: FormData):Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/${id}`,blog);
  }

  deleteBlog(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/delete/${id}`);
  }

  removeBlog(id: number): Observable<Object>{
    return this.httpClient.get(`${this.baseURL}/remove/${id}`);
  }
}
