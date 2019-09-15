import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SharedModule } from '@app/shared/shared.module';
import { ManufacturersComponent } from '@app/manufacturers/manufacturers.component';
import { ManufacturersService } from '@app/manufacturers/manufacturers.service';

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
