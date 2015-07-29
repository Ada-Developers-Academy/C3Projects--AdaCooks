FactoryGirl.define do
  factory :user do
    name "vika"
    password_digest "1234"
    password "1234"
    password_confirmation "1234"
    email "vika@email.com"
  end
end
