import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Observable, of } from 'rxjs';
import { catchError, map } from 'rxjs/operators';

import { Contact } from '@app/contact/contact.model';

@Injectable()
export class ContactsService {
  private contactsEndpoint = '/data/contacts.json';

  constructor(private http: HttpClient) { }

  getContacts(): Observable<Contact[]> {
    return this.http.get<{ data: Contact[] }>(this.contactsEndpoint)
      .pipe(
        map((response: { data: Contact[] }) => response.data),
        catchError(this.handleError<Contact[]>('getContacts', []))
      );
  }

  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error);
      return of(result as T);
    };
  }
}
