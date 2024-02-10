require 'rails_helper'

RSpec.describe 'Creating a Recipe', type: :system do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit new_recipe_path
  end

  it 'successfully creates a new recipe' do
    fill_in 'Name', with: 'Test Recipe'
    fill_in 'Preparation time', with: '10'
    fill_in 'Cooking time', with: '20'
    fill_in 'Description', with: 'This is a test recipe.'
    check 'Public'
    click_button 'Create Food'

    expect(page).to have_content('Test Recipe')
    expect(page).to have_content('This is a test recipe.')
  end
end
