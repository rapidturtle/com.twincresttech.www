require "test_helper"

feature "Static pages" do
  scenario "visit About page" do
    visit about_path
    page.must_have_selector "h1", text: "About Us"
  end

  scenario "visit Contact page" do
    visit contact_path
    page.must_have_selector "h1", text: "Contact Us"
  end

  scenario "visit Support page" do
    visit support_path
    page.must_have_selector "h1", text: "Support"
  end
end
