import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SharedModule } from '@app/shared/shared.module';

import { ContactComponent } from '@app/contact/contact.component';
import { ContactsService } from '@app/contact/contacts.service';

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
