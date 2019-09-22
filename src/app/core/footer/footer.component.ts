import { Component, OnInit } from '@angular/core';

import { AuthService } from '@app/auth/auth.service';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent implements OnInit {
  copyrightDate = new Date();

  constructor(public auth: AuthService) { }

  ngOnInit() {
  }

}
