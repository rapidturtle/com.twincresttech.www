require "test_helper"

feature "Authentication" do
  scenario "sign in with Google" do
    visit root_path
    page.must_have_link "sign-in", href: "/auth/google"
    page.wont_have_link "sign-out", href: sign_out_path

    click_link "sign-in"
    page.wont_have_link "sign-in", href: "/auth/google"
    page.must_have_link "sign-out", href: sign_out_path
  end
end
