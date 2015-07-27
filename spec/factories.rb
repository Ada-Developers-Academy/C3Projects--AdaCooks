FactoryGirl.define do  factory :cookbook do
    name "MyString"
description "MyText"
user nil
  end
  factory :user do
    username "MyString"
password_digest "MyString"
  end
  factory :ingredient do
    name "MyString"
image "MyString"
  end
  factory :recipe do
    name "MyString"
description "MyText"
image "MyString"
preparation "MyText"
user nil
  end


end
