import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { AboutModule } from './about/about.module';
import { ContactModule } from './contact/contact.module';
import { ManufacturersModule } from './manufacturers/manufacturers.module';
import { SharedModule } from './shared/shared.module';
import { SupportModule } from './support/support.module';


@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    AboutModule,
    ContactModule,
    ManufacturersModule,
    SharedModule,
    SupportModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
