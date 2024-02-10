require 'rails_helper'

RSpec.describe ShoppingListsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template with the shopping list' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template('index')
    end
  end
end
