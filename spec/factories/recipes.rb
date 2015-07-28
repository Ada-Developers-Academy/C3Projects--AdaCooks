FactoryGirl.define do
  factory :recipe do
    name "recipe name"
    description "recipe description"
    preparation "recipe preparation"
    image nil # because how?
  end
end
