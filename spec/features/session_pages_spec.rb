require 'rails_helper'

describe "the log in path" do
  it "will allow a user to login" do
    user = FactoryGirl.create(:user)
    visit "/"
    click_on "LOG-IN"
    fill_in "Email", with: "fake@fake.com"
    fill_in "Password", with: "fakepassword"
    click_on "Log In"
    expect(page).to have_content "Hello John Smith"
  end

  it "will give an error if info is incorrect" do
    user = FactoryGirl.create(:user)
    visit new_session_path
    click_on "Log In"
    expect(page).to have_content "There was a problem"
  end
end

describe "the log out path" do
  it "will allow the user to logout" do
    user = FactoryGirl.create(:user)
    visit new_session_path
    fill_in "Email", with: "fake@fake.com"
    fill_in "Password", with: "fakepassword"
    click_on "Log In"
    click_on "LOGOUT"
    expect(page).to have_content "Good-bye John Smith"
  end
end
