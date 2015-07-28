FactoryGirl.define do

  factory :user do
    name "User"
    email "user@email.com"
    password "password"
    password_confirmation "password"
  end

  factory :recipe do
    name "recipe name"
    description "recipe description"
    preparation "recipe preparation"
    image nil # because how?
  end

  factory :cookbook do
    name "cookbook name"
    description "cookbook description"
  end

  factory :ingredient do
    name "ingredient name"
    image nil # because how?
  end
end
