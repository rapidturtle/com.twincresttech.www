class User < ActiveRecord::Base
  include Authentication

  validates :uid,
            :provider,
            :first_name,
            :last_name, presence: true

  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  def name
    %W[#{first_name} #{last_name}].join(" ")
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider   = auth.provider
      user.uid        = auth.uid
      user.first_name = auth.info.first_name
      user.last_name  = auth.info.last_name
      user.email      = auth.info.email
    end
  end
end
