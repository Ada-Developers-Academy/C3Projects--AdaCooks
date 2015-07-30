FactoryGirl.define do
  factory :recipe do
    name "recipe name"
    description "recipe description"
    preparation "recipe preparation"
    image ""
    ingredient_ids [99]
  end
end
