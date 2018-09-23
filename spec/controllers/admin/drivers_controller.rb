require 'rails_helper'

RSpec.describe Admin::DriversController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET :index' do
    context 'User is not signed in' do
      before { get :index }

      it 'returns the status code 302' do
        expect(response).to have_http_status(302)
      end

      it 'redirects back to root_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in but not admin' do
      before do
        sign_in user
        get :index
      end

      it 'returns the status code 302' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to home#index' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is signed in as an admin' do
      let(:user) { FactoryBot.create(:user, is_admin: true) }
      before do
        sign_in user
        get :index
      end

      it 'returns the status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end
end
