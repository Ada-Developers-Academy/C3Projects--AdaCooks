FactoryGirl.define do
  factory :user do
    name "a name"
    email "email@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :recipe do
    name "Chicken Fingers"
    prep "1. Cut chicken into fingers 2. Bread and Fry"
    # tried and failed to build the assoc directly into FactoryGirl
    # factory :recipe_with_ingredients do
      # transient do
        # ingredient_count 5
      # end
      # after(:create) do |recipe, evaluator|
        # create_list(:ingredient, evaluator.ingredients_count, recipe: recipe)
      # end
    # end
  end

  factory :ingredient do
    name "sugar"
  end

  factory :cookbook do
    name "Book Name"
    desc "A book with recipes"
  end

  factory :session do
    email "email@email.com"
    password "password"
  end
end
