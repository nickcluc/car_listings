require 'factory_girl'

FactoryGirl.define do
  factory :car do
    year "2013"
    color "Black"
    mileage 15000
  end
end
