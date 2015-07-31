require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET 'index'" do
    it "renders index" do
      get 'index'
      expect(response).to render_template("index")
    end
  end

  describe "GET 'show' " do
    let!(:recipe){Recipe.create(name: "Hot Tamale Chicken", description: "Corn Husks and Masa filled goodness", preparation: "Cook in oven til warm.", user_id: 1)}
    it "renders show page" do
      get 'show', id: 1
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
   let(:recipe_params) do
     {
       recipe: {
         name: "enchilada",
         preparation: "bake til warm",
         ingredient_ids: 2,
         user_id: 1
       }
     }
   end

   it "creates a new Recipe object" do
     session[:user_id] = create(:user)
     get :new, recipe_params
     expect(assigns(:recipe)).to be_kind_of(Object)
   end
 end
end

#    describe "GET 'new' " do
#      let(:recipe_params) do
#        {
#          recipe: {
#            name: "Yay",
#            preparation: "Yup",
#            user_id: 1
#          }
#        }
#      end
#
#      it "renders the :new view" do
#       get :new, recipe_params
#       expect(response).to render_template("new")
#     end
#   end
# end
# #     let!(:recipe){Recipe.create(name: "Hot Tamale Chicken", description: "Corn Husks and Masa filled goodness", preparation: "Cook in oven til warm.", user_id: 1)}
# #     it "renders the 'new' page" do
#       get 'new', user_id: 1
#       expect(response).to render_template("new")
#     end
#   end
# end


# def recipe_params
#   params.require(:recipe).permit(:name, :description, :preparation, :image, :categories, :user_id)
# end
