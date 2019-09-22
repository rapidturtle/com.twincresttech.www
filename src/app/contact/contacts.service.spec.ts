import { TestBed } from '@angular/core/testing';

import { ContactsService } from '@app/contact/contacts.service';

describe('ContactsService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ContactsService = TestBed.get(ContactsService);
    expect(service).toBeTruthy();
  });
});
