require 'rails_helper'

describe "create user path" do
  it "will create a new user" do
    visit "/"
    click_on "SIGN-UP"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "fake@fake.com"
    fill_in "Password", with: "fakepassword"
    fill_in "Password confirmation", with: "fakepassword"
    click_on "Sign Up"
    expect(page).to have_content "Welcome John Smith"
  end

  it "will display an error if user is not created" do
    visit new_user_path
    click_on "Sign Up"
    expect(page).to have_content "There was a problem"
  end
end
