FactoryGirl.define do
  factory(:user) do
    first_name("John")
    last_name("Smith")
    email("fake@fake.com")
    password("fakepassword")
  end
end
