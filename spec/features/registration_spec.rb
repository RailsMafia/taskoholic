require 'spec_helper'

describe "user registration", :type => :feature do
  it "allows new users to register" do
    visit '/signup'

    fill_in "user_email", with: "john@rambo.com"
    fill_in "user_password", with: "firstBl00d"
    fill_in "user_password_confirmation", with: "firstBl00d"

    click_button "Signup"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end