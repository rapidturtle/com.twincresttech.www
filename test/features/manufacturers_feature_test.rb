require "test_helper"

feature "Manufacturers" do
  scenario "visit home page" do
    visit root_path
    page.must_have_selector "h1", text: "Manufacturers"
  end

  describe "admin links" do
    given(:manufacturer) { Factory :manufacturer }

    scenario "hide `new` link when signed out" do
      visit root_path
      page.wont_have_link nil, href: new_manufacturer_path
    end

    scenario "hide `edit` link when signed out" do
      visit root_path
      page.wont_have_link nil, href: edit_manufacturer_path(manufacturer)
    end

    scenario "hide `delete` link when signed out" do
      visit root_path
      page.wont_have_link nil, href: manufacturer_path(manufacturer)
    end
  end

  describe "create a new manufacturer" do
    background do
      manually_sign_in Factory(:user)
      visit root_path
      click_link nil, href: new_manufacturer_path
    end

    scenario "with valid data" do
      fill_in :manufacturer_name, with: "Wavetronix"
      # TODO: test image upload
      # fill_in :manufacturer_logo, with: ""
      fill_in :manufacturer_description, with: "Go with gold."
      fill_in :manufacturer_web_url, with: "http://www.wavetronix.com"
      fill_in :manufacturer_support_url, with: "http://www.wavetronix.com/support"
      click_button "Create"
      page.must_have_selector ".alert-box", text: "success"
    end
  end
end
