class Manufacturer < ActiveRecord::Base
  acts_as_list
  
  attr_accessible :name, :description, :web_site, :support_site
  
  validates :name, presence: true, on: :create
  validates :description, presence: true, on: :create
end
