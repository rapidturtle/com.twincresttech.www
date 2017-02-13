import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ManufacturersComponent } from './manufacturers.component';
import { ManufacturersService } from './manufacturers.service';

@NgModule({
  imports:      [CommonModule],
  declarations: [ManufacturersComponent],
  providers:    [ManufacturersService],
  exports:      [ManufacturersComponent]
})
export class ManufacturersModule { }
