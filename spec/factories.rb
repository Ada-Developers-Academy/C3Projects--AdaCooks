FactoryGirl.define do
  factory :recipe do
    name 'Chocolate Chip Cookies'
    description 'Everyone loves chocolate chip cookies'
    preparation 'Mix chocolate chips with some other stuff'
    user_id 1
  end

  factory :ingredient do
    name 'Chocolate Chips'
    user_id 2
  end

  factory :user do
    username 'pusheen'
    description 'kitty@meow.com'
    password 'kittycat'
    password_confirmation 'kittycat'
  end
end
