require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  let(:account) { create(:account, name: 'firstcompany') }
  let(:user) do
    create(:user, email: 'admin@firstcompany.com', password: 'password',
                  account: account)
  end

  describe 'GET #create' do
    before do
      user
      post '/sign_in', params: {
        account_name: 'firstcompany',
        email: 'admin@firstcompany.com',
        password: password
      }
    end

    context 'with correct credentials' do
      let(:password) { 'password' }

      it { expect(response).to have_http_status(:success) }
      it { expect(json).to include_json(user: {}) }
    end

    context 'with incorrect credentials' do
      let(:password) { 'wrong_password' }

      it { expect(response).to have_http_status(:unauthorized) }
      it { expect(json).to include_json(message: 'Invalid credentials') }
    end
  end

  describe 'DELETE #destroy' do
    it 'signs out user using delete' do
      delete '/sign_out'
      expect(response).to have_http_status(:success)
      expect(json).to include_json(message: 'Successfully signed out')
    end
  end
end
