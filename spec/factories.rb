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
end
