FactoryGirl.define do
  factory(:user) do
    first_name("John")
    last_name("Smith")
    email("fake@fake.com")
    password("fakepassword")
    id(1)
  end

  factory(:post) do
    question("Test")
    description("Test")
    user_id(1)
  end
end
