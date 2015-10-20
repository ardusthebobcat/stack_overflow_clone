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
    id(1)
  end

  factory(:answer) do
    post_id(1)
    user_id(1)
    description("Test")
  end
end
