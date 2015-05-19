require "test_helper"

feature "Manufacturers" do
  scenario "visit home page" do
    visit root_path
    page.must_have_selector "h1", text: "Twincrest Technologies"
  end

  describe "create a new manufacturer" do
    background do
      manuall_sign_in Factory(:user)
      visit root_path
      click_link nil, href: new_manufacturers_path
    end

    scenario "with valid data" do
      fill_in :manufacturer_name, with: "Wavetronix"
      # TODO: test image upload
      # fill_in :manufacturer_logo, with: ""
      fill_in :manufacturer_description, with: "Go with gold."
      fill_in :manufacturer_home_page, with: "http://www.wavetronix.com"
      fill_in :manufacturer_support_page, with: "http://www.wavetronix.com/support"
      click_button :commit
      page.must_have_selector ".alert-box", text: "success"
    end
  end
end
