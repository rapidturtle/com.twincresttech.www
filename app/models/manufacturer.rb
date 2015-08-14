class Manufacturer < ActiveRecord::Base
  attachment :logo, content_type: ["image/gif", "image/jpeg", "image/png", "image/svg+xml"]

  validates :name,
            :description, presence: true
  validates :web_url, presence: true,
                       format: { with: URI.regexp, message: "must be a valid URL" }
  validates :support_url, format: { with: URI.regexp, message: "must be a valid URL" }, if: Proc.new { |manufacturer| manufacturer.support_url.present? }

  default_scope { order "position" }

  def to_param
    "#{id}-#{name}".parameterize
  end
end
