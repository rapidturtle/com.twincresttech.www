require "test_helper"

describe ManufacturersController do
  it "gets index" do
    get :index
    must_respond_with :success
    assigns(:manufacturers).wont_be_nil
  end

  it "gets new" do
    get :new
    must_respond_with :success
    assigns(:manufacturer).wont_be_nil
  end
end
