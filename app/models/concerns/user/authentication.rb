class User
  module Authentication
    extend ActiveSupport::Concern

    included do
      before_save { generate_token :auth_token }
    end

    private

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
  end
end
