require 'spec_helper'

describe "manufacturers/show.html.erb" do
  before(:each) do
    @manufacturer = assign(:manufacturer, stub_model(Manufacturer))
  end

  it "renders attributes in <p>" do
    render
  end
end
