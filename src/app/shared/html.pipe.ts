import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'html'
})
export class HtmlPipe implements PipeTransform {

  transform(value: any, ...args: any[]): any {
    let html = value;

    html = value.replace(/(?:\\r\\n|\\r|\\n){2}/g, '</p><p>');
    html = value.replace(/(?:\\r\\n|\\r|\\n){1}/g, '<br />');

    return html;
  }

}
