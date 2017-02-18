/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { ManufacturersService } from './manufacturers.service';

describe('ManufacturersService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ManufacturersService]
    });
  });

  it('should ...', inject([ManufacturersService], (service: ManufacturersService) => {
    expect(service).toBeTruthy();
  }));
});
