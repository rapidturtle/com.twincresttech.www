require "test_helper"

describe ManufacturersController do
  it "gets index" do
    get :index
    must_respond_with :success
    assigns(:manufacturers).wont_be_nil
  end

  it "gets show" do
    manufacturer = Factory(:manufacturer)
    get :show, id: manufacturer.id
    must_respond_with :success
    assigns(:manufacturer).wont_be_nil
  end

  it "gets new" do
    get :new
    must_respond_with :success
    assigns(:manufacturer).wont_be_nil
  end

  it "creates a new manufacturer" do
    manufacturer = Factory.build(:manufacturer)
    -> {
      post :create, manufacturer: {
        name: manufacturer.name,
        description: manufacturer.description,
        web_url: manufacturer.web_url,
        support_url: manufacturer.support_url
      }
    }.must_change "Manufacturer.count"
    flash[:notice].wont_be_nil
    must_redirect_to root_path
  end

  it "renders new on error" do
    -> {
      post :create, manufacturer: {
        name: "",
        description: "",
        web_url: "",
        support_url: ""
      }
    }.wont_change "Manufacturer.count"
    assigns(:manufacturer).wont_be_nil
    must_render_template :new
  end

  describe "edit" do
    let(:manufacturer) { Factory :manufacturer }

    it "gets edit" do
      get :edit, id: manufacturer.id
      must_respond_with :success
      assigns(:manufacturer).wont_be_nil
    end

    it "updates a manufacturer" do
      patch :update, id: manufacturer.id, manufacturer: { name: "My New Manufacturer" }
      manufacturer.reload
      manufacturer.name.must_equal "My New Manufacturer"
      flash[:notice].wont_be_nil
      must_redirect_to root_path
    end

    it "renders edit on error" do
      patch :update, id: manufacturer.id, manufacturer: { name: "" }
      assigns(:manufacturer).wont_be_nil
      must_render_template :edit
    end
  end

  it "deletes a manufacturer" do
    manufacturer = Factory(:manufacturer)
    lambda {
      delete :destroy, id: manufacturer.id
    }.must_change "Manufacturer.count", -1
    must_redirect_to root_path
  end
end
