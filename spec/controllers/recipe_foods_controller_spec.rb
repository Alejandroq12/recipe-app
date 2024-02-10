require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :controller do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }
  let(:food) { create(:food, user:) }
  let(:valid_attributes) { { quantity: 3, food_id: food.id, recipe_id: recipe.id } }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new RecipeFood and redirects to the recipe' do
        expect do
          post :create, params: { recipe_id: recipe.id, recipe_food: valid_attributes }
        end.to change(RecipeFood, :count).by(1)
        expect(response).to redirect_to(recipe_path(recipe))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new RecipeFood and renders the new template' do
        expect do
          post :create, params: { recipe_id: recipe.id, recipe_food: valid_attributes.merge(quantity: nil) }
        end.not_to change(RecipeFood, :count)
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:recipe_food) { create(:recipe_food, recipe:, food:) }

    it 'destroys the requested RecipeFood and redirects to the recipe' do
      expect do
        delete :destroy, params: { id: recipe_food.id, recipe_id: recipe.id }
      end.to change(RecipeFood, :count).by(-1)
      expect(response).to redirect_to(recipe_path(recipe))
    end
  end
end
