import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {RouterModule, Routes} from "@angular/router";
import {AdminComponent} from "./admin/admin.component";
import {DashBoardComponent} from "./dash-board/dash-board.component";
import {AboutControlComponent} from "../about/about-control/about-control.component";
import {PostControlComponent} from "../post/post-control/post-control.component";
import {RecruitControlComponent} from "../recruit/recruit-control/recruit-control.component";
import {BlogControlComponent} from "../blog/blog-control/blog-control.component";
import {CustomerControlComponent} from "../customer/customer-control/customer-control.component";
import {ProductControlComponent} from "../product/product-control/product-control.component";
import {SliderControlComponent} from "../sliders/slider-control/slider-control.component";
import {SliderAddComponent} from "../sliders/slider-add/slider-add.component";
import {GalleryListComponent} from "../typical/gallery/gallery-list/gallery-list.component";
import {GalleryControlComponent} from "../typical/gallery/gallery-control/gallery-control.component";
import {NavControlComponent} from "../navigator/nav-control/nav-control.component";

const routes: Routes = [
  {path: '', title: 'Admin - EcoIT', component: AdminComponent,
    children:[
      {path: 'dashboard', component: DashBoardComponent},

      {path: 'about', title: 'Admin - Về chúng tôi', component: AboutControlComponent},

      {path: 'post', title: 'Admin - Tin tức', component: PostControlComponent},
      {path: 'recruit', title: 'Admin - Tuyển dụng', component: RecruitControlComponent},
      {path: 'blog', title: 'Admin - Blog', component: BlogControlComponent},

      {path: 'customer', title: 'Admin - Khách hàng', component: CustomerControlComponent},

      {path: 'product', title: 'Admin - Sản phẩm', component: ProductControlComponent},

      {path: 'sliders', title: 'Admin - Trình chiếu', component: SliderControlComponent},
      {path: 'sliders/add-new', component: SliderAddComponent},
      {path: 'sliders/update/:id', component: SliderAddComponent},

      {path: 'gallery', title: 'Admin - Kho ảnh', component: GalleryListComponent},
      {path: 'typical', title: 'Admin - Ảnh nổi bật', component: GalleryControlComponent},

      {path: 'navigation', title: 'Admin - Điều hướng', component: NavControlComponent}
    ]},
]

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    RouterModule.forChild(routes)
  ],
  exports: [RouterModule]
})
export class AdminModule { }
