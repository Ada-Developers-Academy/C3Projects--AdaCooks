class WelcomeController < ApplicationController
  def index
    @recipes= Recipe.all
  end
end
