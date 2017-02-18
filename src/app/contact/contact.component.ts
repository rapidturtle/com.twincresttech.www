import { Component, OnInit } from '@angular/core';

import { Contact } from './contact.model';
import { ContactsService } from './contacts.service';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss']
})
export class ContactComponent implements OnInit {
  contacts: Contact[];
  errorMessage: string;

  constructor(private contactsService: ContactsService) { }

  ngOnInit() {
    this.getContacts();
  }

  getContacts() {
    this.contactsService.getContacts()
      .subscribe(
        contacts => this.contacts = contacts,
        error => this.errorMessage = <any>error
      );
  }

}
