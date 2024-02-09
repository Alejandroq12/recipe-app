require 'rails_helper'

RSpec.describe 'Adding Food to Recipe', type: :system do
  let!(:user) { create(:user) }
  let!(:recipe) { create(:recipe, user: user) }
  let!(:food) { create(:food, user: user) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    visit new_recipe_recipe_food_path(recipe)
  end
  it 'allows adding food to recipe' do
    select food.name, from: 'Food'
    fill_in 'Quantity', with: '2'
    click_button 'Create Food'
  
    expect(page).to have_content('Food was successfully added to the recipe')
    expect(current_path).to eq(recipe_path(recipe))
  end
end
