require "test_helper"

describe SessionsController do
  it "creates a new session" do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    user = Factory(:user)
    post :create, provider: :google_oauth2
    cookies[:auth_token].must_equal user.auth_token
    must_respond_with :redirect
  end
end
