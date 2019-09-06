import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Observable } from 'rxjs';

import { Contact } from './contact.model';

@Injectable({
  providedIn: 'root'
})
export class ContactsService {
  private contactsEndpoint = '/data/contacts.json';

  constructor(private http: HttpClient) { }

  getContacts() {
    return this.http.get<Contact[]>(this.contactsEndpoint)
      .map(this.extractData)
      .do(data => console.log('ContactsService.getContacts: ' + JSON.stringify(data)))
      .catch(this.handleError)
  }

  private extractData(response: Response) {
    let body = response.json();
    return body.data || {};
  }

  private handleError(error: HttpErrorResponse) {
    let errMsg: string;

    if (error.error instanceof ErrorEvent) {
      // A client-side or network error occurred. Handle it accordingly.
      errMsg = `An error occurred: ${error.error.message}`;
    } else {
      // The backend returned an unsuccessful response code.
      // The response body may contain clues as to what went wrong.
      errMsg = `Backend returned code ${error.status}, body was: ${error.error}`;
    }

    console.error(errMsg);
    return throwError('Something bad happened; please try again later.');
  }
}
