class HomeController < ApplicationController
  def index
    @recipies = Recipe.all
  end
end
