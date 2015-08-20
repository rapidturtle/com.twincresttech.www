OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.google_client_id, Rails.application.secrets.google_client_secret, {
    name: "google",
    scope: "email, profile",
    prompt: "select_account",
    provider_ignores_state: true
  }
end
