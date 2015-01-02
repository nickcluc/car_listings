require "rails_helper"

mfg_params = {
  name: "Ford",
  country: "USA"
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

    mfg = Manufacturer.create(mfg_params)

    save_and_open_page

    fill_in "Name", with: mfg.name
    fill_in "Country", with: mfg.country

    click_on "Create Manufacturer"

    expect(page).to have_content "Manufacturer Successfully Created!"
    expect(page).to have_content mfg.name
    expect(page).to have_content mfg.country
    current_path.should == manufacturers_path

  end
end
