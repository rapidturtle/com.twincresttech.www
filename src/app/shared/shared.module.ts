import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HtmlPipe } from './html.pipe';

@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [HtmlPipe]
})
export class SharedModule { }
