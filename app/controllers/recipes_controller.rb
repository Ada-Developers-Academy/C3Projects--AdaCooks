class RecipesController < ApplicationController
  before_action :require_user_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @recipes = Recipe.alphabetized # TODO: write scope
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def show
    @recipe = Recipe.find(params[:id])
    # TODO: Add in image to view, fix ingredient path
  end

  def destroy; end

  private
    def create_params
      # make sure you include the :avatar!
    end
end
