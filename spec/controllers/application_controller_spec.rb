require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  # # def check_search
  # #   if params[:search]
  # #       @search_results = Recipe.joins(:ingredients).where("ingredients.name LIKE ?", "%#{params[:search][:query]}%")
  # #   end
  # # end
  #
  # describe "searching for recipes by ingredients" do
  #
  #   it "returns related recipes" do
  #     ingredient = create :ingredient
  #     create :recipe, ingredient_ids: [ingredient.id]
  #
  #     get :check_search, search: { query: "chicken" }
  #
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #
  #     # don't know how to tell it it's not supposed to render a :check_search view
  #   end
  #
  # end

end
