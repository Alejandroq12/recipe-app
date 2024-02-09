require 'rails_helper'

RSpec.describe 'New Food', type: :system do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit new_food_path
  end

  it 'renders the form and back link' do
    expect(page).to have_selector('form')
    expect(page).to have_field('Name')
    expect(page).to have_link('Back to foods', href: foods_path)
  end
end
