import { Component, OnInit } from '@angular/core';

import { Observable } from 'rxjs';

import { Manufacturer } from '@app/manufacturers/manufacturer.model';
import { ManufacturersService } from '@app/manufacturers/manufacturers.service';

@Component({
  selector: 'app-manufacturers',
  templateUrl: './manufacturers.component.html',
  styleUrls: ['./manufacturers.component.scss']
})
export class ManufacturersComponent implements OnInit {
  manufacturers: Observable<Manufacturer[]>;

  constructor(private manufacturersService: ManufacturersService) { }

  ngOnInit() {
    this.getManufacturers();
  }

  getManufacturers() {
    this.manufacturers = this.manufacturersService.getManufacturers();
  }
}
