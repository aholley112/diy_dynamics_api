require 'rails_helper'

RSpec.describe 'Profiles API', type: :request do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }
  let(:user_id) { user.id }

  describe 'GET /users/:user_id/profile' do
    context 'when the profile does not exist' do
      before do
        user_without_profile = create(:user)
        get "/users/#{user_without_profile.id}/profile"
      end
  
      it 'returns a not found status' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
  

  describe 'POST /users/:user_id/profile' do
    let(:valid_attributes) { { profile: { bio: 'New Bio' } } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/profile", params: valid_attributes }

      it 'creates a new profile' do
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['bio']).to eq('New Bio')
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/profile", params: { profile: { bio: '' } } } 

      it 'does not create a profile' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /users/:user_id/profile' do
    let(:valid_attributes) { { profile: { bio: 'Updated Bio' } } }

    context 'when the profile exists' do
      before { put "/users/#{user_id}/profile", params: valid_attributes }

      it 'updates the profile' do
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['bio']).to eq('Updated Bio')
      end
    end
  end
  describe 'DELETE /users/:user_id/profile' do
    before { delete "/users/#{user_id}/profile" }

    it 'deletes the profile' do
      user.reload
      expect(user.profile).to be_nil
      expect(response).to have_http_status(:no_content)
    end
  end
end



