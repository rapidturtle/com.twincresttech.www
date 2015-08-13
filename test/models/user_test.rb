require "test_helper"

describe User do
  let(:user) { Factory.build :user }

  it "is a valid object" do
    user.must_be :valid?
  end

  it "requires a UID" do
    user.uid = " "
    user.wont_be :valid?
  end

  it "requires a provider" do
    user.provider = " "
    user.wont_be :valid?
  end

  it "requires a first name" do
    user.first_name = " "
    user.wont_be :valid?
  end

  it "requires a last name" do
    user.last_name = " "
    user.wont_be :valid?
  end

  it "generates a full name" do
    user.name.must_equal "Mickey Mouse"
  end

  it "requires an email address" do
    user.email = " "
    user.wont_be :valid?
  end

  it "accepts a valid email address" do
    addresses = %w[
      user@foo.com
      THE_USERS@mail.example.com
      first.last@foo.jp
      a+b@foo.org
    ]
    addresses.each do |valid_email|
      user.email = valid_email
      user.must_be :valid?
    end
  end

  it "rejects an invalid email address" do
    addresses = %w[
      user@foo,com
      user_at_foo.org
      example.user@foo.
      foo@bar_baz.com
      foo@bar+baz.com
    ]
    addresses.each do |invalid_email|
      user.email = invalid_email
      user.wont_be :valid?
    end
  end
end
