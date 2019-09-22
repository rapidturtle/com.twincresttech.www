import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HtmlPipe } from '@app/shared/html.pipe';


@NgModule({
  declarations: [HtmlPipe],
  imports: [
    CommonModule
  ],
  exports: [
    HtmlPipe
  ]
})
export class SharedModule { }
