require 'spec_helper'

describe "manufacturers/index.html.erb" do
  before(:each) do
    assign(:manufacturers, [
      stub_model(Manufacturer),
      stub_model(Manufacturer)
    ])
  end

  it "renders a list of manufacturers" do
    render
  end
end
