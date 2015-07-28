FactoryGirl.define do
  factory :user do
    username "FirstUser"
    email "firstuser@email.com"
    password "password"
    password_confirmation "password"
  end
end
