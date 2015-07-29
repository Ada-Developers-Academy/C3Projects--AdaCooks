class RecipesController < ApplicationController
	before_action :login_required, except: [:index, :show]

	def index
		@recipes = Recipe.alphabetize
	end
end
