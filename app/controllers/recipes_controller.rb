class RecipesController < ApplicationController

	def index
		@recipes = Recipe.alphabetize
	end
end
