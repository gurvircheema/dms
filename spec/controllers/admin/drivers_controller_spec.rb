require 'rails_helper'

RSpec.describe Admin::DriversController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:driver) { FactoryBot.create(:driver) }

  describe '#index' do
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
      let(:user) { FactoryBot.create(:user, admin: true) }
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

  describe '#show' do
    context 'User is not signed in' do
      before { get :show, params: { id: driver.id } }

      it 'returns the status code 302' do
        expect(response).to have_http_status(302)
      end

      it 'redirects back to root_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in as an admin' do
      let(:user) { FactoryBot.create(:user, admin: true) }
      before do
        sign_in user
        get :show, params: { id: driver.id }
      end

      it 'returns the status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end
    end
  end

  describe '#create' do
    let(:valid_attributes) { FactoryBot.attributes_for(:driver) }

    context 'User is not signed in' do
      before { post :create, params: { driver: valid_attributes } }

      it 'returns the status code 302' do
        expect(response).to have_http_status(302)
      end

      it 'redirects back to root_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in as an admin' do
      let(:user) { FactoryBot.create(:user, admin: true) }
      let(:create_request) do
        post :create, params: { driver: valid_attributes }
      end
      before do
        sign_in user
        create_request
      end

      it 'returns the status code 302' do
        expect(response).to have_http_status(302)
      end

      it 'creates the driver' do
        expect(Driver.last.name).to match(valid_attributes[:name])
      end
    end
  end

  describe '#update' do
    let!(:driver) { FactoryBot.create(:driver) }
    context 'User is not signed in' do
      before { put :update, params: { id: driver.id, driver: { name: 'Test User'} } }

      it 'returns the status code 302' do
        expect(response).to have_http_status(302)
      end

      it 'redirects back to root_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in as an admin' do
      let(:user) { FactoryBot.create(:user, admin: true) }
      before do
        sign_in user
        put :update, params: { id: driver.id, driver: { name: 'Test User'} }
      end

      it 'returns the status code 302' do
        expect(response).to have_http_status(302)
      end

      it 'creates the driver' do
        driver.reload
        expect(driver.name).to eq('Test User')
      end
    end
  end

  describe '#destroy' do
    context 'User is not signed in' do
      before { delete :destroy, params: { id: driver.id } }

      it 'returns the status code 302' do
        expect(response).to have_http_status(302)
      end

      it 'redirects back to root_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in as an admin' do
      let(:user) { FactoryBot.create(:user, admin: true) }
      before do
        sign_in user
        delete :destroy, params: { id: driver.id }
      end

      it 'returns the status code 302' do
        expect(response).to have_http_status(302)
      end

      it 'marks the driver active' do
        driver.reload
        expect(driver.active).to eq(false)
      end
    end
  end

  # describe '#new' do
  #   before { get :new }
  #   it 'returns the status code 200' do
  #     get :new
  #     expect(assigns(:driver)).to be_a_new(Driver)
  #     expect(response).to have_https_status(200)
  #   end
  #
  #   it 'renders the new template' do
  #     get :new
  #     expect(response).to render_template(:new)
  #   end
  # end
  #
  # describe '#edit' do
  #   before { get :edit, params: { id: driver.id } }
  #   it 'renders the edit template' do
  #     expect(response).to render_template(:edit)
  #   end
  # end
end
