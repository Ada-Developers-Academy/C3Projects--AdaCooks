FactoryGirl.define do

  # factory :ingredient do
  #   name "Pineapple"
  #     # do we need a user_id???
  # end

  factory :ingredient_params do
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
  end
end
