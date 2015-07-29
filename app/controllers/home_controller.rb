class HomeController < ApplicationController

  def index
    @recipes = Recipe.newest(10)
    # I set a number limit here in case we'd like to control how many
    # show up per page.
  end
end
