FactoryGirl.define do
  factory :user do
    username "gurl"
    email { "#{username}@example.com" }
    password "gurl"
    password_confirmation "gurl"
  end

  factory :recipe do
    name "Apple Crisp"
    user
  end
end
