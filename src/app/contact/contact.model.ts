import { Address } from '@app/contact/address.model';

export interface Contact {
  name: string;
  address: Address;
  telephone: string;
  email: string;
}
