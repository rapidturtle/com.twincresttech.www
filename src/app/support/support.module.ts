import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SupportComponent } from './support.component';

@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [SupportComponent],
  exports: [SupportComponent]
})
export class SupportModule { }
