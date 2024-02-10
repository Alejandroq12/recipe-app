require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) { { name: 'Recipe Name', preparation_time: 10, cooking_time: 20, description: 'Test Description', public: true, user_id: user.id } }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "assigns @recipes and renders the index template" do
      recipe = user.recipes.create!(valid_attributes)
      get :index
      expect(assigns(:recipes)).to eq([recipe])
      expect(response).to render_template("index")
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Recipe" do
        expect {
          post :create, params: { recipe: valid_attributes }
        }.to change(Recipe, :count).by(1)
      end

      it "redirects to the created recipe" do
        post :create, params: { recipe: valid_attributes }
        expect(response).to redirect_to(recipe_url(Recipe.last))
      end
    end
  end
end
