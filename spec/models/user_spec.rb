require 'rails_helper'

describe User do
  it {should validate_presence_of :first_name}
  it {should validate_presence_of :last_name}
  it {should validate_presence_of :email}
  it {should validate_presence_of :password_hash}
  it {should have_many :posts}
  it {should have_many :answers}

  it "returns the full name of the user" do
    user = FactoryGirl.create(:user)
    expect(user.full_name).to eq "John Smith"
  end
end
