require 'rails_helper'

RSpec.describe 'Profiles', type: :request do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }
  let(:user_id) { user.id }
  let(:token) { auth_token_for_user(user) }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }

  # Test for GET. Show profile
  describe 'GET /users/:user_id/profile' do
    context 'when the profile does not exist' do
      before do
        user_without_profile = create(:user)
        get "/users/#{user_without_profile.id}/profile", headers: headers
      end
  
      it 'returns a not found status' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  # Test for POST. Create profile
  describe 'POST /users/:user_id/profile' do
    let(:valid_attributes) { { bio: 'New Bio' } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/profile", params: valid_attributes, headers: headers }

      it 'creates a new profile' do
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['bio']).to eq('New Bio')
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/profile", params:  { bio: '' }, headers: headers }

      it 'does not create a profile' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  # Test for PUT. Update profile
  describe 'PUT /users/:user_id/profile' do
    let(:valid_attributes) { { bio: 'Updated Bio' } }

    context 'when the profile exists' do
      before { put "/users/#{user_id}/profile", params: valid_attributes, headers: headers }

      it 'updates the profile' do
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['bio']).to eq('Updated Bio')
      end
    end
  end

  # Test for DELETE. Delete profile
  describe 'DELETE /users/:user_id/profile' do
    before { delete "/users/#{user_id}/profile", headers: headers }

    it 'deletes the profile' do
      user.reload
      expect(user.profile).to be_nil
      expect(response).to have_http_status(:no_content)
    end
  end
end
