import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { InstallersComponent } from '@app/installers/installers.component';

@NgModule({
  declarations: [InstallersComponent],
  imports: [
    CommonModule
  ],
  exports: [InstallersComponent]
})
export class InstallersModule { }
