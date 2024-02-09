require 'rails_helper'

RSpec.describe 'New Recipe Page', type: :system do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit new_recipe_path
  end

  it 'renders the form and back link' do
    expect(page).to have_selector('form')
    expect(page).to have_link('Back to recipes', href: recipes_path)
  end
end
