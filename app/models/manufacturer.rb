class Manufacturer < ActiveRecord::Base
  attr_accessible :name, :description, :web_site, :support_site
  
  validates :name, presence: true, on: :create
  validates :description, presence: true, on: :create
end
