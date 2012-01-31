require 'spec_helper'

describe "manufacturers/edit.html.erb" do
  before(:each) do
    @manufacturer = assign(:manufacturer, stub_model(Manufacturer))
  end

  it "renders the edit manufacturer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => manufacturers_path(@manufacturer), :method => "post" do
      assert_select "input[name=?][type=text]", "manufacturer[name]"
      assert_select "textarea[name=?]", "manufacturer[description]"
      assert_select "input[name=?][type=text]", "manufacturer[web_site]"
      assert_select "input[name=?][type=text]", "manufacturer[support_site]"
    end
  end
end
