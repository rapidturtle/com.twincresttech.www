require "test_helper"

describe SessionsController do
  it "creates a new session" do
    user = OmniAuth.config.mock_auth[:google]
    request.env["omniauth.auth"] = user
    post :create, provider: :google
    found_user = User.find_by(uid: user.uid)
    cookies[:auth_token].must_equal found_user.auth_token
    must_respond_with :redirect
  end

  it "redirects to home page with message on failure" do
    get :fail, message: "There was a problem."
    flash[:alert].wont_be_nil
    must_respond_with :redirect
  end

  it "destroys a session" do
    user = Factory(:user)
    sign_in user
    delete :destroy
    cookies[:auth_token].must_be_nil
    must_respond_with :redirect
  end
end
