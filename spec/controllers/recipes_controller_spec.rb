require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
	describe "GET index" do
		before :each do
			["E", "C", "B", "D", "F", "A"].each do |letter|
				create :recipe, name: letter
			end
		end

		it "lists all the recipes" do
			get :index
			expect(assigns(:recipes).count).to eq Recipe.count
		end

		it "lists the recipes alphabetically by name" do
			get :index

			title_order = []
			assigns(:recipes).each do |recipe|
				title_order << recipe.name
			end

			expect(title_order).to eq ["A", "B", "C", "D", "E", "F"]
		end

		it "renders the :index view" do
			get :index
			expect(subject).to render_template :index
		end
	end

	describe "GET new" do
		before :each do
			["A", "B", "C"].each do |letter|
				create :cookbook, name: letter
			end

			create :user
			session[:user_id] = 1
		end

		it 'assigns an empty Recipe object' do
			get :new
			expect(assigns(:recipe)).to be_a_kind_of Recipe
		end

		it 'makes an array of cookbooks names and their IDs' do
			expected_array = [["None", nil], ["A", 1], ["B", 2], ["C", 3]]
			get :new

			expect(assigns(:cookbooks_array)).to eq expected_array
		end

		it 'makes an array of measurment values' do
			expected_array = [["", ""], ["tsp", "tsp"], ["tbsp", "tbsp"], ["cup", "cup"], ["ounce", "ounce"], ["gram", "gram"], ["pound", "pound"], ["piece", "piece"]]
			get :new

			expect(assigns(:measurements_array)).to eq expected_array
		end
	end

	describe "POST create" do
		before :each do
			session[:user_id] = 1
		end

		let(:params) { { :recipe => { name: "recipe", description: "it's good",
			prep: "mix well", recipe_ingredients_attributes: [quantity: 1, measurement: "cup",
			ingredient_name: "lemon"] } } }

		it "creates a new Recipe object" do
			post :create, params
			expect(Recipe.count).to eq 1
		end

		it "creates a new RecipeIngredient object" do
			post :create, params
			expect(RecipeIngredient.count).to eq 1
		end

		context "object successfully saved" do
			let(:params) { { :recipe => { name: "recipe", description: "it's good",
				prep: "mix well", recipe_ingredients_attributes: [quantity: 1, measurement: "cup",
				ingredient_name: "lemon"] } } }

			it "redirects to recipe :show view" do
				post :create, params
				expect(subject).to redirect_to recipe_path(1)
			end
		end

		context "object did not save" do
			let(:params) { { :recipe => { description: "it's good",
				prep: "mix well", recipe_ingredients_attributes: [quantity: 1, measurement: "cup",
				ingredient_name: "lemon"] } } }

			it "redirects back to create a recipe" do
				post :create, params
				expect(subject).to redirect_to new_recipe_path
			end
		end
	end
end
