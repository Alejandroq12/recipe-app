require 'rails_helper'

RSpec.describe 'Viewing Recipes', type: :system do
  let(:user) { create(:user) }
  let!(:recipes) { create_list(:recipe, 3, user:, public: true) }

  before do
    sign_in user
    visit recipes_path
  end

  it 'displays all recipes' do
    recipes.each do |recipe|
      expect(page).to have_content(recipe.name)
    end
  end
end
