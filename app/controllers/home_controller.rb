class HomeController < ApplicationController
  include ApplicationHelper
  before_action :define_user

  SAMPLE_SIZE = 3

  def index
    @recipes = Recipe.all.sample(3)
    @ingredients = Ingredient.all.sample(3)
  end
end
