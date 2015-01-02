class Manufacturer < ActiveRecord::Base
  validates :name, :country, presence: true
end
