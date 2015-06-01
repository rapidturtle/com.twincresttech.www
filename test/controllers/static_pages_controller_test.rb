require "test_helper"

describe StaticPagesController do
  it "gets about" do
    get :about
    must_respond_with :success
  end

  it "gets contact" do
    get :contact
    must_respond_with :success
  end

  it "gets support" do
    get :support
    must_respond_with :success
  end
end
