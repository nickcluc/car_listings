require 'rails_helper'

mfg_params = {
  name: 'Ford',
  country: 'United States of America'
}

feature "User adds a newly acquired car to the database", %{

  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot

  Acceptance Criteria:

  [ ] I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an existing manufacturer should be created).
  [ ] Only years from 1920 and above can be specified.
  [ ] I can optionally specify a description of the car.
  [ ] If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success.
  [ ] If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  [ ] Upon successfully creating a car, I am redirected back to the index of cars.

} do

  scenario "User Successfully Adds A Car" do
    @mfg = Manufacturer.create(mfg_params)
    car = FactoryGirl.build(:car)

    visit new_car_path

    expect(page).to have_content "Add A Car"

    select(@mfg.name, from: 'Manufacturer')
    fill_in "Color", with: car.color
    select(car.year, from: 'Year')
    fill_in "Mileage", with: car.mileage

    click_on "Create Car"

    expect(current_path) == cars_path
    expect(page).to have_content "Car Saved Successfully!"
    expect(page).to have_content car.year
    expect(page).to have_content car.manufacturer


  end

  scenario "User Unsuccessfully Adds A Car" do

    visit new_car_path

    click_on "Create Car"
    expect(current_path) == new_car_path
    expect(page).to have_content "can't be blank"
  end

end
