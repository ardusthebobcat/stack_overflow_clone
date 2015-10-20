require 'rails_helper'

describe "new post" do
  it "will add a new post" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    visit new_session_path
    fill_in "Email", with: "fake@fake.com"
    fill_in "Password", with: "fakepassword"
    click_on "Log In"
    visit post_path(post)
    click_on "Answer This!"
    fill_in "Description", with: "Test Answer"
    click_on "Create Answer"
    expect(page).to have_content "Test Answer"
  end

  it "will display an error if there are errors" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    visit new_session_path
    fill_in "Email", with: "fake@fake.com"
    fill_in "Password", with: "fakepassword"
    click_on "Log In"
    visit new_post_answer_path(post)
    click_on "Create Answer"
    expect(page).to have_content "There was a problem!"
  end
end
