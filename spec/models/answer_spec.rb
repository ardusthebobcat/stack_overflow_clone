require 'rails_helper'

describe Answer do
  it {should validate_presence_of :description}
  it {should belong_to :post}
  it {should belong_to :user}
end
