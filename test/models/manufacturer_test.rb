require "test_helper"

describe Manufacturer do
  let(:manufacturer) { Factory.build :manufacturer }

  it "is a valid object" do
    manufacturer.must_be :valid?
  end

  it "requires a name" do
    manufacturer.name = " "
    manufacturer.wont_be :valid?
  end

  it "requires a description" do
    manufacturer.description = " "
    manufacturer.wont_be :valid?
  end

  it "requires a website address" do
    manufacturer.web_url = " "
    manufacturer.wont_be :valid?
  end

  it "rejects an invalid URL for website address" do
    manufacturer.web_url = "some random string"
    manufacturer.wont_be :valid?
  end

  it "accepts a valid URL for website address" do
    manufacturer.web_url = "http://www.twincresttech.com"
    manufacturer.must_be :valid?
  end

  it "has a support site address" do
    manufacturer.must_respond_to :support_url
  end


  it "rejects an invalid URL for support site address" do
    manufacturer.support_url = "some random string"
    manufacturer.wont_be :valid?
  end

  it "accepts a valid URL for support site address" do
    manufacturer.support_url = "http://www.twincresttech.com/support"
    manufacturer.must_be :valid?
  end

  it "doesn't require a support site address" do
    manufacturer.support_url = ""
    manufacturer.must_be :valid?
  end
end
