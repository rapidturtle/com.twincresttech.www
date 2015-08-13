require "test_helper"

describe SessionsController do
  it "creates a new session" do
    user = OmniAuth.config.mock_auth[:google_oauth2]
    request.env["omniauth.auth"] = user
    post :create, provider: :google_oauth2
    found_user = User.find_by(uid: user.uid)
    cookies[:auth_token].must_equal found_user.auth_token
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
