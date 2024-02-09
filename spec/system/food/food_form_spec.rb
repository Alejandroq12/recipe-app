require 'rails_helper'

RSpec.describe "Food Form", type: :system do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit new_food_path
  end

  it "renders the form" do
    expect(page).to have_selector('form')
    expect(page).to have_field('Name')
    expect(page).to have_field('Measurement unit')
    expect(page).to have_field('Price')
    expect(page).to have_field('Quantity')
  end
end
