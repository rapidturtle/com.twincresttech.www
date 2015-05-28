class Manufacturer < ActiveRecord::Base
  validates :name,
            :description, presence: true
  validates :web_url, presence: true,
                       format: { with: URI.regexp, message: "must be a valid URL" }
  validates :support_url, format: { with: URI.regexp, message: "must be a valid URL" }, if: Proc.new { |manufacturer| manufacturer.support_url.present? }
end
