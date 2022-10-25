import { Component, OnInit } from '@angular/core';
import {FileService} from "../../../../services/file/file.service";
import {File} from "../../../../services/file/file";
import * as fileSaver from "file-saver";

@Component({
  selector: 'app-gallery-control',
  templateUrl: './gallery-control.component.html',
  styleUrls: ['./gallery-control.component.css']
})
export class GalleryControlComponent implements OnInit {

  images: File[] = [];
  image: File = new File();
  target = {
    url: '',
    id: 1,
    name: '',
    target: '',
    action: ''
  };

  constructor(private imageService: FileService) { }

  ngOnInit(): void {
    this.listAllImages();
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

  deleteImg(e: any){
    var option = window.confirm("Bạn có chắc chắc sẽ xóa file này?")
    if(option === true){
      this.imageService.deleteFile(e).subscribe( data =>{
        // this.getProduct();
      });
    }
  }
}
