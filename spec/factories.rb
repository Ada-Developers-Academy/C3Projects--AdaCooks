FactoryGirl.define do

  factory :ingredient_params do
    # can we do this?
  end

  factory :recipe_params do
    # can we do this?
  end

  factory :user do
    id 2
    username "myspacerox"
    password "2002"
    password_confirmation "2002"
  end


  factory :recipe do
    name "Soup"
    preparation "Stir It"

  end

  factory :ingredient do
    name "Water"
  end

  factory :cookbook do
    name "Paula Deen vs Jimmy Dean"
    description "This is the ultimate Battle Royale, with CHEESE!"
  end
end
