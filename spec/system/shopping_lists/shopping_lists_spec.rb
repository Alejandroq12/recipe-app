require 'rails_helper'

RSpec.describe 'General Shopping List', type: :system do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  context 'when shopping list is not empty' do
    before do
      create_data_for_shopping_list
      visit shopping_lists_path
    end

    it 'displays the shopping list with items' do
      expect(page).to have_content('General Shopping List')
      expect(page).to have_content('Total Food Items to Buy:')
      expect(page).to have_content('Total Value of Food Needed:')
    end
  end

  context 'when shopping list is empty' do
    before do
      RecipeFood.delete_all
      Food.delete_all
      visit shopping_lists_path
    end

    it 'displays a message indicating the food is well-stocked' do
      expect(page).to have_content('No missing items. Your food is well-stocked!')
    end
  end

  def create_data_for_shopping_list
    food = create(:food, user:, quantity: 1)
    recipe = create(:recipe, user:, public: true)
    create(:recipe_food, recipe:, food:, quantity: 5)
  end
end
