require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    context 'User not logged in' do
      it 'returns http success' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'User logged in' do
      let(:user) { FactoryBot.create(:user) }

      before do
        sign_in user
        get :index
      end

      it 'returns the 200 status code' do
        expect(response).to have_http_status(200)
      end

      it 'returns the index template' do
        expect(response).to render_template(:index)
      end
    end
  end
end
