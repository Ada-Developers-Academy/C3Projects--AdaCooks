FactoryGirl.define do
  factory :recipe do
    name "Pizza"
    description "delicious"
    photo_url "an image url"
    preparation "tomato, crust, cheese, meat"
    cookbook nil
    ingredients { |a| [a.association(:ingredient)] }
  end
end

