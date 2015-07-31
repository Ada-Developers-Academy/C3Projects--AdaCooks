FactoryGirl.define do
  factory :user do
    sequence(:username){ |n| "User#{n}" }
    email { "#{username}@example.com" }
    password "w0rd"
    password_confirmation "w0rd"
  end

  factory :recipe do
    sequence(:name){ |n| "Recipe#{n}" }
    user
  end

  factory :ingredient do
    sequence(:name){ |n| "Ingredient#{n}" }
    user
  end

  factory :step do
    sequence(:number){ |n| n }
    directions "Here are directions."
    recipe
  end

  factory :measurement do
    sequence(:amount){ |n| "#{n} tsp" }
    ingredient
    step
    recipe
  end

  factory :cookbook do
    name "How to Cook"
    description "You like know how to cook?"
    user
  end
end
