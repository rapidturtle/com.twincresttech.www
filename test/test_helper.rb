require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

require "database_cleaner"
require "minitest/pride"
require "minitest/rails"
require "minitest/rails/capybara"

Dir[File.expand_path("test/factories/**/*.rb")].each { |file| require file }

DatabaseCleaner.strategy = :transaction

OmniAuth.config.test_mode = true

google_oauth2_hash = {
  provider: "google_oauth2",
  uid: "0123456789",
  info: {
    email: "mickey.mouse@disney.com",
    first_name: "Mickey",
    last_name: "Mouse"
  }
}

OmniAuth.config.add_mock(:google_oauth2, google_oauth2_hash)

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical
  # order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def manually_sign_in(user)
    OmniAuth.config.mock_auth[:google_oauth2]
    visit sign_in_path
    click_link nil, href: "/auth/google_oauth2"
  end

  def sign_in(user)
    cookies[:auth_token] = user.auth_token
  end
end

class Minitest::Test
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
