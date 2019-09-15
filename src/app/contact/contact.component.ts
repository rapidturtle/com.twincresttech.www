import { Component, OnInit } from '@angular/core';

import { Observable } from 'rxjs';

import { Contact } from '@app/contact/contact.model';
import { ContactsService } from '@app/contact/contacts.service';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss']
})
export class ContactComponent implements OnInit {
  contacts: Observable<Contact[]>;

  constructor(private contactsService: ContactsService) { }

  ngOnInit() {
    this.getContacts();
  }

  getContacts() {
    this.contacts = this.contactsService.getContacts();
  }
}
