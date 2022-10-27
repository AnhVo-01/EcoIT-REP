import { Component, OnInit } from '@angular/core';
import {File} from "../../../../services/file/file";
import {FileService} from "../../../../services/file/file.service";
import * as fileSaver from "file-saver";
import {HttpParams} from "@angular/common/http";
import {GalleryService} from "../../../../services/gallery/gallery.service";

@Component({
  selector: 'app-gallery-list',
  templateUrl: './gallery-list.component.html',
  styleUrls: ['./gallery-list.component.css']
})
export class GalleryListComponent implements OnInit {

  images: File[] = [];
  target = {
    url: '',
    id: 1,
    name: '',
    target: '',
    action: ''
  };

  searchField = {
    pageIndex: 1,
    pageSize: 20,
    totalElements: 0
  }
  totalPages: any;
  pageSizes = [20, 32, 44];

  addSuccess = false;
  Message = null;

  constructor(private imageService: FileService ,private galleryService: GalleryService) { }

  ngOnInit(): void {
    this.listAllImages();
  }

  getBySearch(){
    const params = new HttpParams()
      .set('pageNo', this.searchField.pageIndex)
      .set('pageSize', this.searchField.pageSize)
    this.imageService.pageableList(params).subscribe(data => {
      this.images = data.content;
      this.searchField.totalElements = data.totalElements;
      this.totalPages = data.totalPages;
    });
  }

  pageChanged(event: any){
    this.searchField.pageIndex = event;
    this.getBySearch();
  }

  changePageSize(psize: any) {
    this.searchField.pageSize = psize.target.value;
    this.searchField.pageIndex = 1;
    this.getBySearch();
  }

  listAllImages(){
    this.imageService.getAllImage().subscribe(data =>{
      this.images = data;
      this.target.url = this.images[0].url;
      this.target.name = this.images[0].name;
      this.target.target = this.images[0].target;
    })
  }

  choose(e: any){
    this.target.url = e.target.src;
    this.target.id = e.target.id;
    this.target.name = e.target.alt;
  }

  downloadImg(e: any){
    this.imageService.getFileById(e).subscribe(data1 =>{
      this.imageService.downloadFile(data1).subscribe( (data:any) =>{
        let blob = new Blob([data.body], {type: data.body.type})
        fileSaver.saveAs(blob, data1.name);
      })
    })
  }

  addToTypical(id: any){
    this.galleryService.addAlreadyById(id).subscribe( () =>{
      this.addSuccess = true;
      // @ts-ignore
      this.Message = "Thêm thành công!";
      this.listAllImages();
    },err =>{
      this.addSuccess = false
      this.Message = err.error.message;
    })
  }

}
