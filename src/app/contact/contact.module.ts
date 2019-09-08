import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SharedModule } from '../shared/shared.module';

import { ContactComponent } from './contact.component';
import { ContactsService } from './contacts.service';

@NgModule({
  declarations: [ContactComponent],
  imports: [
    CommonModule,
    SharedModule
  ],
  exports: [ContactComponent],
  providers: [ContactsService]
})
export class ContactModule { }
