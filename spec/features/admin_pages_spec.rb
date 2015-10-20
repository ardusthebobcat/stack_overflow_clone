require 'rails_helper'

describe "show path" do
  it "will show an admin page" do
    admin = FactoryGirl.create(:admin)
    visit new_session_path
    fill_in "Email", with: "jane@doe.com"
    fill_in "Password", with: "janedoe"
    click_on "Log In"
    click_on "Jane Doe"
    expect(page).to have_content "Admin Page for Jane Doe"
  end

  it "will give an error if user isn't admin" do
    user = FactoryGirl.create(:user)
    visit new_session_path
    fill_in "Email", with: "fake@fake.com"
    fill_in "Password", with: "fakepassword"
    click_on "Log In"
    visit "/admin"
    expect(page).to have_content "You cannot view this page!"
  end
end

describe "admin privileges" do
  it "will allow admin to delete answers" do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    answer = FactoryGirl.create(:answer)
    visit new_session_path
    fill_in "Email", with: "jane@doe.com"
    fill_in "Password", with: "janedoe"
    click_on "Log In"
    click_on "Jane Doe"
    click_on "Delete Answer"
    expect(page).to have_no_content "Test Answer"
  end

  it "will allow admin to delete post" do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    answer = FactoryGirl.create(:answer)
    visit new_session_path
    fill_in "Email", with: "jane@doe.com"
    fill_in "Password", with: "janedoe"
    click_on "Log In"
    click_on "Jane Doe"
    click_on "Delete Post"
    expect(page).to have_no_content "Test Post"
  end

  it "will allow admin to delete user" do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    answer = FactoryGirl.create(:answer)
    visit new_session_path
    fill_in "Email", with: "jane@doe.com"
    fill_in "Password", with: "janedoe"
    click_on "Log In"
    click_on "Jane Doe"
    click_on "Delete John Smith"
    expect(page).to have_no_content "John Smith"
  end

  it "will allow admin to give admin status" do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    answer = FactoryGirl.create(:answer)
    visit new_session_path
    fill_in "Email", with: "jane@doe.com"
    fill_in "Password", with: "janedoe"
    click_on "Log In"
    click_on "Jane Doe"
    click_on "Make John Smith an Admin"
    expect(page).to have_content "John Smith is now an admin!"
  end

  it "will allow admin to give admin status" do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    answer = FactoryGirl.create(:answer)
    visit new_session_path
    fill_in "Email", with: "jane@doe.com"
    fill_in "Password", with: "janedoe"
    click_on "Log In"
    click_on "Jane Doe"
    click_on "Make John Smith an Admin"
    click_on "Remove John Smith's Adminship"
    expect(page).to have_content "John Smith is no longer an admin!"
  end
end
