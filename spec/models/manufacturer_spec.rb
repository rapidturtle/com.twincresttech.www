require 'spec_helper'

describe Manufacturer do
  it "is valid with valid attributes" do
    manufacturer = Factory.build(:manufacturer)
    manufacturer.should be_valid
  end
  
  it "is not valid without a name" do
    manufacturer = Factory.build(:manufacturer, name: nil)
    manufacturer.should_not be_valid
  end
  
  it "is not valid without a description" do
    manufacturer = Factory.build(:manufacturer, description: nil)
    manufacturer.should_not be_valid
  end
end
