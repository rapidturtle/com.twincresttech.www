require "test_helper"

describe SessionsController do
  it "creates a new session" do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    post :create, provider: :google_oauth2
    user = User.first
    cookies[:auth_token].must_equal user.auth_token
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
