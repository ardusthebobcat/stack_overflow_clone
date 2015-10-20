FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Smith"
    email "fake@fake.com"
    password "fakepassword"
    id 1
    admin false
  end

  factory :post do
    question "Test Post"
    description "Test"
    user_id 1
    id 1
  end

  factory :answer do
    post_id 1
    user_id 1
    description "Test Answer"
  end

  factory :admin, class: User do
    first_name "Jane"
    last_name "Doe"
    email "jane@doe.com"
    password "janedoe"
    id 2
    admin true
  end
end
