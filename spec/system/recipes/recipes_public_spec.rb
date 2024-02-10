require 'rails_helper'

RSpec.describe 'Public Recipes', type: :system do
  let(:user) { create(:user) }
  let!(:public_recipes) { create_list(:recipe, 2, user:, public: true) }

  before do
    visit public_recipes_path
  end

  it 'displays public recipes' do
    public_recipes.each do |recipe|
      expect(page).to have_content(recipe.name)
      expect(page).to have_content("By: #{recipe.user.name}")
    end
  end
end
