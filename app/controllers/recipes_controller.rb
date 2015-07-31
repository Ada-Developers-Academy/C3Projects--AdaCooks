class RecipesController < ApplicationController
	before_action :login_required, except: [:index, :show]

	def index
		@recipes = Recipe.alphabetize
		@first_letters = @recipes.map { |r| r.name[0] }
		@first_letters.uniq
	end

	def new
		@recipe = Recipe.new
		@recipe.recipe_ingredients.build

		# move to model?
		user = User.find(session[:user_id])
		@user_cookbooks = user.cookbooks

		# move to model?
		@measurements_array = []
		measurements = RecipeIngredient::MEASUREMENTS.each do |measurement|
			# [label (for view), value (sent to db)]
			@measurements_array << [measurement, measurement]
		end
	end

	def create
		recipe = Recipe.new(create_params)

		if recipe.valid?
			recipe.save
			redirect_to recipe_path(recipe)
		else
			flash[:error] = "Your recipe did not save."
			redirect_to new_recipe_path
		end
	end

	def show
		@recipe = Recipe.find(params[:id])

		# move to model?
		user = User.find(session[:user_id])
		user_cookbooks = user.cookbooks.map { |c| [c.name, c.id] }
		@cookbooks_array = user_cookbooks.unshift(["None", nil])
	end

	def edit
		@recipe = Recipe.find(params[:id])

		# move to model?
		user = User.find(session[:user_id])
		@user_cookbooks = user.cookbooks
		@cookbooks_array = user.cookbooks.map { |c| [c.name, c.id] }

		# move to model?
		@measurements_array = []
		measurements = RecipeIngredient::MEASUREMENTS.each do |measurement|
			# [label (for view), value (sent to db)]
			@measurements_array << [measurement, measurement]
		end
	end

	def update
		recipe = Recipe.find(params[:id])
		recipe.update(create_params)

		redirect_to recipe_path(recipe)
	end

	def destroy
		recipe = Recipe.find(params[:id])
		recipe.destroy

		redirect_to user_path(session[:user_id])
	end

	private

	def create_params
		params.require(:recipe).permit(:user_id, :name, :description, :image_url, :prep,
			:cookbook_id, recipe_ingredients_attributes: [:id, :quantity, :measurement,
			:ingredient_name])
	end

	def add_ingredient_field
	end
end
