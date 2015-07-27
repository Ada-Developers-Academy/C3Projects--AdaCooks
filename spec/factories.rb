FactoryGirl.define do
  factory :user do
    name "a name"
    email "email@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end