require "spec_helper"

describe "user sign in", type: :feature  do
  it "allows users to sign in" do
    user = User.create(
      name: 'Jason Fried',
      email: "jason@basecamp.com",
      password: "ilovetaskoholic"
      )

    visit "/login"

    fill_in "user_email",    :with => "jason@basecamp.com"
    fill_in "user_password", :with => "ilovetaskoholic"

    click_button "Sign in"

    expect(page).to have_content("Signed in successfully.")
  end

  it "allows user to log out" do
    visit "/logout"
    expect(page).to have_content("Welcome to the Taskoholic")
  end
end