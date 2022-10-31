import {NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';
import {CustomerAddComponent} from "./modules/customer/customer-add/customer-add.component";
import {HomeComponent} from "./modules/home/home-page/home.component";
import {PageNotFoundComponent} from "./authentication/404/page-not-found.component";
import {LoginComponent} from "./authentication/login/login.component";
import {RegisterComponent} from "./authentication/register/register.component";
import {PostAddComponent} from "./modules/post/post-add/post-add.component";
import {ProductAddComponent} from "./modules/product/product-add/product-add.component";
import {RecruitAddComponent} from "./modules/recruit/recruit-add/recruit-add.component";
import {RecruitListComponent} from "./modules/recruit/recruit-list/recruit-list.component";
import {PostListComponent} from "./modules/post/post-list/post-list.component";
import {PostDetailsComponent} from "./modules/post/post-details/post-details.component";
import {AboutDetailsComponent} from "./modules/about/about-details/about-details.component";
import {RecruitDetailsComponent} from "./modules/recruit/recruit-details/recruit-details.component";
import {ProductDetailsComponent} from "./modules/product/product-details/product-details.component";
import {NumberAddComponent} from "./modules/typical/number/number-add/number-add.component";
import {CustomerDetailsComponent} from "./modules/customer/customer-details/customer-details.component";
import {BlogListComponent} from "./modules/blog/blog-list/blog-list.component";
import {BlogAddComponent} from "./modules/blog/blog-add/blog-add.component";
import {GalleryAddComponent} from "./modules/typical/gallery/gallery-add/gallery-add.component";
import {Authenticate} from "./authentication/authenticate.service";
import {ContactFromComponent} from "./modules/about/contacts/contact-from/contact-from.component";

const routes: Routes = [
  {path: 'trang-chu', component: HomeComponent},
  {path: 'tuyen-dung', component: RecruitListComponent},
  {path: 'tuyen-dung/:url', component: RecruitDetailsComponent},
  {path: 'tin-tuc', component: PostListComponent},
  {path: 'tin-tuc/:url', component: PostDetailsComponent},
  {path: 'san-pham/:url', component: ProductDetailsComponent},
  {path: 've-chung-toi', component: AboutDetailsComponent},
  {path: 'khach-hang/:url', component: CustomerDetailsComponent},
  {path: 'blog', component: BlogListComponent},
  {path: 'lien-he', component: ContactFromComponent},

  {path: 'admin', redirectTo: 'admin/dashboard', pathMatch: 'full'},
  {path: 'admin', canActivate: [Authenticate],
    loadChildren: () => import('./modules/admin/admin.module').then(m => m.AdminModule)},

  {path: 'd/post/new', title: 'Admin - Tin tức', component: PostAddComponent},
  {path: 'd/post/update/:id', title: 'Admin - Tin tức', component: PostAddComponent},
  {path: 'd/recruit/new', title: 'Admin - Tuyển dụng', component: RecruitAddComponent},
  {path: 'd/recruit/update/:id', title: 'Admin - Tuyển dụng', component: RecruitAddComponent},
  {path: 'd/blog/new', title: 'Admin - Blog', component: BlogAddComponent},
  {path: 'd/blog/update/:id', title: 'Admin - Blog', component: BlogAddComponent},

  {path: 'd/customer/add-new-customer', title: 'Admin - Khách hàng', component: CustomerAddComponent},
  {path: 'd/customer/update-cus/:id', title: 'Admin - Khách hàng', component: CustomerAddComponent},

  {path: 'd/product/new', component: ProductAddComponent},
  {path: 'd/product/update/:id', component: ProductAddComponent},

  {path: 'd/typical/new', component: GalleryAddComponent},
  {path: 'd/typical/update/:id', component: GalleryAddComponent},

  {path: 'd/typical-number/new', component: NumberAddComponent},
  {path: 'd/typical-number/update/:id', component: NumberAddComponent},

  {path: 'register', component: RegisterComponent},
  {path: 'login', component: LoginComponent},

  {path: '', redirectTo: '/trang-chu', pathMatch: 'full'},
  {path: '**', component: PageNotFoundComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
