require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) { { name: 'Apple', measurement_unit: 'kg', price: 1, quantity: 5, user_id: user.id } }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Food' do
        expect do
          post :create, params: { food: valid_attributes }
        end.to change(Food, :count).by(1)
      end

      it 'redirects to the foods index' do
        post :create, params: { food: valid_attributes }
        expect(response).to redirect_to(foods_url)
      end
    end
  end
end
