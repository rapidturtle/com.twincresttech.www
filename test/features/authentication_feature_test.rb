require "test_helper"

feature "Authentication" do
  scenario "sign in with Google" do
    visit root_path
    page.must_have_link nil, href: "/auth/google_oauth2"

    click_link nil, href: "/auth/google_oauth2"
    page.must_have_link nil, href: sign_out_path
  end
end
