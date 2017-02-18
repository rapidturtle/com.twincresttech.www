import { Injectable } from '@angular/core';
import { Http, Response } from '@angular/http';

import { Observable } from 'rxjs/Rx';

import { Contact } from './contact.model';

@Injectable()
export class ContactsService {
  private contactsEndpoint = '/data/contacts.json';

  constructor(private http: Http) { }

  getContacts(): Observable<Contact[]> {
    return this.http.get(this.contactsEndpoint)
      .map(this.extractData)
      // .do(data => console.log('ContactsService.getContacts: ' + JSON.stringify(data)))
      .catch(this.handleError)
  }

  private extractData(response: Response) {
    let body = response.json();
    return body.data || {};
  }

  private handleError(error: Response | any) {
    let errMsg: string;
    if (error instanceof Response) {
      const body = error.json() || '';
      const err  = body.error || JSON.stringify(body);
      errMsg     = `${error.status} - ${error.statusText || ''} ${err}`;
    } else {
      errMsg     = error.message ? error.message : error.toString();
    }
    console.log(errMsg);
    return Observable.throw(errMsg);
  }
}
