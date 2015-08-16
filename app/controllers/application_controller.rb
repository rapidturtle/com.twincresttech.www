class ApplicationController < ActionController::Base
  before_action :initialize_omniauth_state

  protected

  def initialize_omniauth_state
    session["omniauth.state"] = response.headers["X-CSRF-Token"] = form_authenticity_token
  end

  private

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user
end
