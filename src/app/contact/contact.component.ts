import { Component, OnInit } from '@angular/core';

import { Observable } from 'rxjs';

import { Contact } from './contact.model';
import { ContactsService } from './contacts.service';

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
