class HomeController < ApplicationController

  SAMPLE_SIZE = 3

  def index
    @recipes = Recipe.all.sample(SAMPLE_SIZE)
  end

end
