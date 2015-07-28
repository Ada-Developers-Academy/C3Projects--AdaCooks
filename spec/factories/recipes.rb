FactoryGirl.define do
  factory :recipe do
    name "recipe name"
    steps "1. first step, 2. another step, 3. final step "
    description "this is a recipe for food"
    user_id 1
  end
end
