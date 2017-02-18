import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SharedModule } from '../shared/shared.module';

import { ContactComponent} from './contact.component';
import { ContactsService} from './contacts.service';

@NgModule({
  imports:      [CommonModule, SharedModule],
  declarations: [ContactComponent],
  providers:    [ContactsService],
  exports:      [ContactComponent]
})
export class ContactModule { }
