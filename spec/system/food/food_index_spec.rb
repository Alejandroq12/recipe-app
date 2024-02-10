require 'rails_helper'

RSpec.describe 'Foods Index', type: :system do
  let(:user) { create(:user) }
  let!(:foods) { create_list(:food, 2, user:) }

  before do
    sign_in user
    visit foods_path
  end

  it 'displays all foods' do
    foods.each do |food|
      expect(page).to have_content(food.name)
      expect(page).to have_content(food.measurement_unit)
      expect(page).to have_content(format('%.2f', food.price))
      expect(page).to have_content(food.quantity.to_s)
    end
  end

  it 'has link to add new food' do
    expect(page).to have_link('Add Food', href: new_food_path)
  end
end
