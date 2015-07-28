FactoryGirl.define do  

  factory :ingredient do
    name "An ingredient"
    image ""
  end

	factory :user do
		username 'Toastee'
		email 'toastee@flavaflav.com'
		password 'jentoof'
		password_confirmation 'jentoof'
	end

  factory :cookbook do
    name 'Cookbook'
    description 'description'
    user_id 1
  end
end
