import { Injectable } from '@angular/core';
import { Http, Response } from '@angular/http';

import { Observable } from 'rxjs/Rx';

import { Manufacturer } from './manufacturer.model';

@Injectable()
export class ManufacturersService {
  private manufacturersEndpoint = '/data/manufacturers.json';

  constructor(private http: Http) { }

  getManufacturers(): Observable<Manufacturer[]> {
    return this.http.get(this.manufacturersEndpoint)
      .map(this.extractData)
      // .do(data => console.log('ManufacturersService.getManufacturers: ' + JSON.stringify(data)))
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
