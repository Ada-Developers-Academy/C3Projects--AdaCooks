require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  describe "GET 'index'" do
    it "renders index" do
      get 'index'
      expect(response).to render_template("index")
    end
  end

  describe "GET 'show'" do
    let!(:ingredient){Ingredient.create(name: "Basil", id: 1)}
    it "renders show page" do
      get 'show', id: 1
      expect(response).to render_template("show")
    end
  end

  

end
