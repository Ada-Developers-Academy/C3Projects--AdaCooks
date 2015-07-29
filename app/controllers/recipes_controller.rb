class RecipesController < ApplicationController
	before_action :login_required, except: [:index, :show]

	def index
		@recipes = Recipe.alphabetize
	end

	def new
		@recipe = Recipe.new
		@recipe.recipe_ingredients.build

		# move to model?
		user_cookbooks = Cookbook.where(user_id: session[:user_id]).map { |c| [c.name, c.id] }
		@cookbooks_array = user_cookbooks.unshift(["None", nil])

		# move to model?
		count = 1
		@measurements_array = []
		measurements = RecipeIngredient::MEASUREMENTS.each do |measurement|
			@measurements_array << [measurement, count]
			count += 1
		end
	end

	def create
		recipe = Recipe.create(create_params)
		redirect_to recipe_path(recipe)
	end

	private

	def create_params
		params.require(:recipe).permit(:name, :description, :image_url, :prep,
			:cookbook_id, recipe_ingredients_attributes: [:quantity, :measurement,
			:ingredient_name])
	end
end
