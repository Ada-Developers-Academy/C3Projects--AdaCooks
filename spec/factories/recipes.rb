FactoryGirl.define do
  factory :recipe do
    name "Pizza"
    description "delicious"
    image_url "an image url"
    preparation "tomato, crust, cheese, meat"
    cookbook nil
  end

  factory :ingredients do
    recipes {[FactoryGirl.create(:recipe)]}
    name "Tomato"
    image_url "a picture"
  end
end

