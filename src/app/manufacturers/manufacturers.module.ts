import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SharedModule } from '../shared/shared.module';

import { ManufacturersComponent } from './manufacturers.component';
import { ManufacturersService } from './manufacturers.service';

@NgModule({
  imports:      [CommonModule, SharedModule],
  declarations: [ManufacturersComponent],
  providers:    [ManufacturersService],
  exports:      [ManufacturersComponent]
})
export class ManufacturersModule { }
