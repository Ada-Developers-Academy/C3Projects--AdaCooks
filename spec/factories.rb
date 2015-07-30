FactoryGirl.define do

  factory :cookbook do
    name "Snacks"
    description "Snacks on snacks"
    user_id 1
    # recipe
    end

  factory :user do
    username "user1"
    password "1234abcd"
    password_confirmation "1234abcd"
  end

  factory :ingredient do
    name "yams"
    user_id 1
    # recipe
  end

  factory :recipe do
    name "Delicious Food"
    description "This is really tasty"
    preparation "Honestly this is just a roasted yam"
    user_id 1
    # ingredient
    # cookbook
  end
end
