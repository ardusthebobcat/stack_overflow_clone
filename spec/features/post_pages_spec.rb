require 'rails_helper'

describe "add new post" do
  it "will add a new post" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on "LOG-IN"
    fill_in "Email", with: "fake@fake.com"
    fill_in "Password", with: "fakepassword"
    click_on "Log In"
    visit user_path(user)
    click_on "Add Post"
    fill_in "Question", with: "Test Post"
    fill_in "Description", with: "Test"
    click_on "Create Post"
    expect(page).to have_content "Test Post"
  end

  it "will give errors if post isn't created" do
    user = FactoryGirl.create(:user)
    visit new_session_path
    fill_in "Email", with: "fake@fake.com"
    fill_in "Password", with: "fakepassword"
    click_on "Log In"
    visit user_path(user)
    click_on "Add Post"
    click_on "Create Post"
    expect(page).to have_content "There was a problem"
  end
end

describe "post page" do
  it "will show a specific posts page" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    visit'/'
    click_on "Test Post"
    expect(page).to have_content "Test Post"
  end
end
