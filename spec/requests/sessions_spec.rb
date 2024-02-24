require 'rails_helper'

RSpec.describe 'Sessions API', type: :request do
  let!(:user) { create(:user, password: 'testpassword', password_confirmation: 'testpassword') }

  describe 'POST /login' do
    let(:valid_credentials) { { username: user.username, password: 'testpassword' } }
    let(:invalid_credentials) { { username: user.username, password: 'wrongpassword' } }

    context 'when request is valid' do
      before { post '/login', params: valid_credentials }

      it 'returns an auth token' do
        expect(json['token']).not_to be_nil
      end
    end

    context 'when request is invalid' do
      before { post '/login', params: invalid_credentials }

      it 'returns a failure message' do
        expect(response).to have_http_status(:unauthorized)
        expect(json['error']).to match(/Invalid username or password/)
      end
    end
  end
end
