import { Address } from './address.model';

export class Contact {
  constructor(
    public name: string,
    public address: Address,
    public telephone: string,
    public email: string
  ) {}
}
