import { Component, OnInit } from '@angular/core';

import { Manufacturer } from './manufacturer.model';
import { ManufacturersService } from './manufacturers.service';

@Component({
  selector: 'app-manufacturers',
  templateUrl: './manufacturers.component.html',
  styleUrls: ['./manufacturers.component.scss']
})
export class ManufacturersComponent implements OnInit {
  manufacturers: Manufacturer[];
  errorMessage: string;

  constructor(private manufacturersService: ManufacturersService) { }

  ngOnInit() {
    this.getManufacturers();
  }

  getManufacturers() {
    this.manufacturersService.getManufacturers()
      .subscribe(
        manufacturers => this.manufacturers = manufacturers,
        error => this.errorMessage = <any>error
      );
  }
}
