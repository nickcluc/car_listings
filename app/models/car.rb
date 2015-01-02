class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer_id, :year, :color, :mileage, presence: true
  validates :year, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1920,
    less_than_or_equal_to: Time.now.year + 1
  }
end
