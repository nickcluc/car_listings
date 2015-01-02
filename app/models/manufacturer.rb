class Manufacturer < ActiveRecord::Base
  has_many :cars

  validates :name, :country, presence: true
end
