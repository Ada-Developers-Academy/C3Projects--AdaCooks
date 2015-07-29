class HomeController < ApplicationController
  include ApplicationHelper
  before_action :define_user

  SAMPLE_SIZE = 3

  def index
    @recipes = Recipe.all.sample(SAMPLE_SIZE)
    @ingredients = Ingredient.all.sample(SAMPLE_SIZE)
  end
end
