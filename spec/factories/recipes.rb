FactoryGirl.define do
  factory :recipe do
    name "salted caramel ice cream"
    description "a creamy, smooth, classic ice cream"
    image "salted_caramel_ice_cream.jpg"
    preparation """1. Make caramel.\n2.Heat cream, add to beaten egg yolks.\n3. Freeze.\n4. Eat."""
    # won't allow :user.id -- why?
    user_id 1
  end
end
