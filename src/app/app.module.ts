import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';
import { SharedModule } from './shared/shared.module';
import { AboutModule } from './about/about.module';
import { ContactModule } from './contact/contact.module';
import { InstallersModule } from './installers/installers.module';
import { ManufacturersModule } from './manufacturers/manufacturers.module';
import { SupportModule } from './support/support.module';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    SharedModule,
    AboutModule,
    ContactModule,
    InstallersModule,
    ManufacturersModule,
    SupportModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
