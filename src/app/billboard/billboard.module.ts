import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BillboardComponent } from './billboard.component';

@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [BillboardComponent],
  exports: [BillboardComponent]
})
export class BillboardModule { }
