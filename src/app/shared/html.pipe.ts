import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'html'
})
export class HtmlPipe implements PipeTransform {

  transform(value: any): any {
    return value.replace(/(?:\\r\\n|\\r|\\n){2}/g, '</p><p>');
  }

}
