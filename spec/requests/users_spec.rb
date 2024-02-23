require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }


  describe 'GET /users' do
    before { get '/users' }

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns all users' do
      expect(JSON.parse(response.body).size).to eq(User.count)
    end
  end

  describe 'GET /users/:id' do
    before { get "/users/#{user.id}" }

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the user' do
      expect(JSON.parse(response.body)['id']).to eq(user.id)
    end
  end

  describe 'POST /users' do
    let(:user_attributes) { attributes_for(:user) }
    
    it 'creates a new user' do
      expect {
        post '/users', params: { user: user_attributes }
      }.to change(User, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end
  

  describe 'PUT /users/:id' do
    let(:new_attributes) { { username: 'updateduser' } }

    before { put "/users/#{user.id}", params: { user: new_attributes } }

    it 'updates the user' do
      user.reload
      expect(user.username).to eq('updateduser')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /users/:id' do
    it 'deletes a user' do
      expect {
        delete "/users/#{user.id}"
      }.to change(User, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
