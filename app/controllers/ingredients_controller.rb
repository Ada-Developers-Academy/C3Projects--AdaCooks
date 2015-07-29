class IngredientsController < ApplicationController
  before_action :set_ingredient, only: :show
  before_action :require_user_login, only: [:new, :create, :edit, :update, :destroy]

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
