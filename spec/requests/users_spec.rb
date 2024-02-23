require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }

  describe 'GET /users' do
    before { get '/users' }

    it 'returns all users' do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET /users/:id' do
    before { get "/users/#{user_id}" }

    it 'returns the user' do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(user.id)
    end
  end

  describe 'POST /users' do
    let(:valid_attributes) { { user: attributes_for(:user) } }

    it 'creates a new user' do
      expect {
        post '/users', params: valid_attributes
      }.to change(User, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /users/:id' do
    let(:valid_attributes) { { user: { username: 'UpdatedUsername' } } }

    before { put "/users/#{user_id}", params: valid_attributes }

    it 'updates the user' do
      updated_user = User.find(user_id)
      expect(updated_user.username).to eq('UpdatedUsername')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /users/:id' do
    it 'deletes the user' do
      expect {
        delete "/users/#{user_id}"
      }.to change(User, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
