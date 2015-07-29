require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
	describe "GET index" do
		before :each do
			["E", "C", "B", "D", "F", "A"].each do |letter|
				create :recipe, name: letter
			end
		end

		it "lists all the recipes" do
			get :index
			expect(assigns(:recipes).count).to eq Recipe.count
		end

		it "lists the recipes alphabetically by name" do
			get :index

			title_order = []
			assigns(:recipes).each do |recipe|
				title_order << recipe.name
			end

			expect(title_order).to eq ["A", "B", "C", "D", "E", "F"]
		end

		it "renders the :index view" do
			get :index
			expect(subject).to render_template :index
		end
	end
end
