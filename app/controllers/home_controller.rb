class HomeController < ApplicationController
  include ApplicationHelper
  before_action :define_user

  def index
    @recipes = Recipe.all
    @cookbooks = Cookbook.all
    @ingredients = Ingredient.all
  end
end
