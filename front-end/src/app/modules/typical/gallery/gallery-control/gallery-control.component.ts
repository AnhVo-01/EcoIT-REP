import { Component, OnInit } from '@angular/core';
import {FileService} from "../../../../services/file/file.service";
import {File} from "../../../../services/file/file";

@Component({
  selector: 'app-gallery-control',
  templateUrl: './gallery-control.component.html',
  styleUrls: ['./gallery-control.component.css']
})
export class GalleryControlComponent implements OnInit {

  images: File[] = [];
  target = {
    url: '',
    id: 1,
    name: '',
    target: '',
    action: '',
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
    this.imageService.downloadFile(e).subscribe( data =>{
      this.listAllImages();
    })
  }
}
