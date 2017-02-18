import { TwincrestPage } from './app.po';

describe('twincrest App', function() {
  let page: TwincrestPage;

  beforeEach(() => {
    page = new TwincrestPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
