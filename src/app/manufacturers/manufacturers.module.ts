import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ManufacturersComponent } from './manufacturers.component';
import { SharedModule } from '../shared/shared.module';
import { ManufacturersService } from './manufacturers.service';

@NgModule({
  declarations: [ManufacturersComponent],
  imports: [
    CommonModule,
    SharedModule
  ],
  exports: [ManufacturersComponent],
  providers: [ManufacturersService]
})
export class ManufacturersModule { }
