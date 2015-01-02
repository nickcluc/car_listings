require "rails_helper"

mfg_params = {
  name: "Ford",
  country: "United States of America"
}

feature "user records a car manufacturer", %{

  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot

  Acceptance Criteria:

  [ ] I must specify a manufacturer name and country.
  [ ] If I do not specify the required information, I am presented with errors.
  [ ] If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers

} do

  scenario "User successfully creates a car manufacturer" do

    visit new_manufacturer_path

    mfg = Manufacturer.new(mfg_params)

    expect(page).to have_content "Create A New Manufacturer"

    fill_in "Name", with: mfg.name
    select(mfg.country, from: 'Country')

    click_on "Create Manufacturer"

    expect(page).to have_content "Manufacturer Saved Successfully!"
    expect(page).to have_content mfg.name
    expect(current_path) == manufacturers_path

  end

  scenario "User unsuccessfully creates a car manufacturer" do

    visit new_manufacturer_path

    click_on "Create Manufacturer"

    expect(page).to have_content "can't be blank"
    expect(current_path) == new_manufacturer_path

  end
end
