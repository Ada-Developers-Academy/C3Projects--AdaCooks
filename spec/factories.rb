FactoryGirl.define do
  factory :user do
    username "chef_adam"
    password "hello"
    password_confirmation "hello"
    id 1
  end

  factory :cookbook do
    name "Cheesey Cheese"
    description "All kinds of cheese!"
    user_id 1
  end

  factory :recipe do
    name "Cherry Pie"
    description "Like mom made"
    preparation "buy from store"
    user_id 1
  end

  factory :ingredient do
    name "Basil"
  end
end
