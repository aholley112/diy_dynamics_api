require 'rails_helper'

RSpec.describe 'Materials', type: :request do
  let!(:materials) { create_list(:material, 10) }
  let(:material_id) { materials.first.id }
  let(:user) { create(:user) }
  let(:token) { auth_token_for_user(user) }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }

  # GET /materials
  describe 'GET /materials' do
    # make HTTP get request before each example
    before { get '/materials', headers: headers }

    it 'returns materials' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
      expect(response).to have_http_status(200)
    end
  end

  # GET /materials/:id
  describe 'GET /materials/:id' do
    before { get "/materials/#{material_id}", headers: headers }

    context 'when the record exists' do
      it 'returns the material' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(material_id)
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:material_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # POST /materials
  describe 'POST /materials' do
    # valid payload
    let(:valid_attributes) { { material_name: 'Linen', description: 'High quality linen' } }

    context 'when the request is valid' do
      before { post '/materials', params: valid_attributes, headers: headers }

      it 'creates a material' do
        expect(json['material_name']).to eq('Linen')
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/materials', params: { material_name: 'Foam' }, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  # PUT /materials/:id
  describe 'PUT /materials/:id' do
    let(:valid_attributes) { { material_name: 'Updated Material' } }

    context 'when the record exists' do
      before { put "/materials/#{material_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response).to have_http_status(200)
        expect(json['material_name']).to eq('Updated Material')
      end
    end
  end

  # DELETE /materials/:id
  describe 'DELETE /materials/:id' do
    before { delete "/materials/#{material_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
