import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Observable, of } from 'rxjs';
import { catchError, map } from 'rxjs/operators';

import { Manufacturer } from '@app/manufacturers/manufacturer.model';

@Injectable({
  providedIn: 'root'
})
export class ManufacturersService {
  private manufacturersEndpoint = '/data/manufacturers.json';

  constructor(private http: HttpClient) { }

  getManufacturers(): Observable<Manufacturer[]> {
    return this.http.get<{ data: Manufacturer[] }>(this.manufacturersEndpoint)
      .pipe(
        map((response: { data: Manufacturer[] } ) => response.data),
        catchError(this.handleError<Manufacturer[]>('getManufacturers', []))
      )
  }

  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error);
      return of(result as T);
    };
  }
}
