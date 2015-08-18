require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

require "minitest/pride"
require "minitest/rails"
require "minitest/rails/capybara"

Dir[File.expand_path("test/factories/**/*.rb")].each { |file| require file }

OmniAuth.config.test_mode = true

google_hash = {
  provider: "google",
  uid: "1234567890",
  info: {
    email: "mickey.mouse@disney.com",
    first_name: "Mickey",
    last_name: "Mouse"
  }
}

OmniAuth.config.add_mock(:google, google_hash)

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical
  # order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def manually_sign_in(_user)
    OmniAuth.config.mock_auth[:google]
    visit root_path
    click_link nil, href: "/auth/google"
  end

  def sign_in(user)
    cookies[:auth_token] = user.auth_token
  end
end
