import { HtmlPipe } from '@app/shared/html.pipe';

describe('HtmlPipe', () => {
  it('create an instance', () => {
    const pipe = new HtmlPipe();
    expect(pipe).toBeTruthy();
  });
});
