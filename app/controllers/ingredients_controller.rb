class IngredientsController < ApplicationController
  before_action :set_ingredient, only: :show

  def index # FIXME: ingredients#index test
    @ingredients = Ingredient.alphabetized
  end

  def new; end
  def create; end
  def edit; end
  def update; end
  def show; end # FIXME: replace links in this view with actual URLs instead of links back to root! # FIXME: ingredients#show test
  def destroy; end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
end
