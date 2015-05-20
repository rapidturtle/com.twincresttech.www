class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    cookies[:auth_token] = user.auth_token
    redirect_to root_path, notice: "#{user.name} signed in successfully!"
  end
end
