import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {RouterModule, Routes} from "@angular/router";
import {AdminComponent} from "../admin/admin/admin.component";
import {DashBoardComponent} from "../admin/dash-board/dash-board.component";
import {AboutControlComponent} from "../about/about-control/about-control.component";
import {GalleryListComponent} from "../typical/gallery/gallery-list/gallery-list.component";
import {UserControlComponent} from "../user/user-control/user-control.component";
import {HistoryListComponent} from "../admin/history/history-list/history-list.component";

const routes: Routes = [
  {path: '', title: 'Admin - EcoIT', component: AdminComponent,
    children:[
      {path: 'dashboard', component: DashBoardComponent},

      {path: 'about', title: 'Admin - Về chúng tôi', component: AboutControlComponent},

      {path: 'post', title: 'Admin - Tin tức',
        loadChildren: () => import('./post.module').then(m => m.PostModule)
      },

      {path: 'recruit', title: 'Admin - Tuyển dụng',
        loadChildren: () => import('./recruit.module').then(m => m.RecruitModule)
      },
      {path: 'blog', title: 'Admin - Blog',
        loadChildren: () => import('./blog.module').then(m => m.BlogModule)
      },

      {path: 'customer', title: 'Admin - Khách hàng',
        loadChildren: () => import('./customer.module').then(m => m.CustomerModule)
      },

      {path: 'product', title: 'Admin - Sản phẩm',
        loadChildren: () => import('./product.module').then(m => m.ProductModule)
      },

      {path: 'sliders', title: 'Admin - Trình chiếu',
        loadChildren: () => import('./slider.module').then(m => m.SliderModule)
      },

      {path: 'typical',
        loadChildren: () => import('./typical.module').then(m => m.TypicalModule)
      },

      {path: 'gallery', title: 'Admin - Kho ảnh', component: GalleryListComponent},

      {path: 'navigation', title: 'Admin - Điều hướng',
        loadChildren: () => import('../navigator/navigation.module').then(m => m.NavigationModule)},

      {path: 'user', title: 'Admin - Tài khoản', component: UserControlComponent},

      {path: 'history', title: 'Admin - Lịch sử sửa đổi', component: HistoryListComponent},

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
