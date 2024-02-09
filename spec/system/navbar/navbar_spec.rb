require 'rails_helper'

RSpec.describe 'Navbar', type: :system do
  let!(:user) { create(:user) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'

    expect(page).to have_content('Logout')
  end

  it 'displays the navbar links when signed in' do
    expect(page).to have_link('Recipe List', href: recipes_path)
    expect(page).to have_link('Public Recipes', href: public_recipes_path)
    expect(page).to have_link('Food List', href: foods_path)
    expect(page).to have_link('New Food', href: new_food_path)
    
    expect(page).to have_button('Logout')
  end

end
