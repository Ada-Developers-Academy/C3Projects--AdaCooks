class IngredientsController < ApplicationController
  before_action :set_ingredient, only: :show

  def index
    @ingredients = Ingredient.alphabetized
  end

  def new; end
  def create; end
  def edit; end
  def update; end
  def show; end
  def destroy; end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
end
