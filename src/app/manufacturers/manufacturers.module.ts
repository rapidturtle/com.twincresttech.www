import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ManufacturersComponent } from './manufacturers.component';



@NgModule({
  declarations: [ManufacturersComponent],
  imports: [
    CommonModule
  ],
  exports: [ManufacturersComponent]
})
export class ManufacturersModule { }
