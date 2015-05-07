require "test_helper"

describe ManufacturersController do
  it "gets index" do
    get :index
    must_respond_with :success
  end
end
