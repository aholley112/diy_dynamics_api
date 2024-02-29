require 'rails_helper'

RSpec.describe "Materials", type: :request do
  let(:user) { create(:user) } 
  let(:materials) { create_list(:material, 10) }
  let(:material_id) { materials.first.id }
  let(:token) { auth_token_for_user(user) } 
  let(:headers) { { "Authorization" => "Bearer #{token}" } }

  before { materials }
  
  describe 'GET /materials' do
    before { get '/materials', headers: headers }

    it 'returns materials' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
      expect(response).to have_http_status(200)
    end
    end

describe 'POST /materials' do
  let(:valid_attributes) { { material_name: 'Lumber', description: 'Pine wood for construction' } }

  context 'when the request is valid' do
    before { post '/materials', params: valid_attributes, headers: headers }

    it 'creates a material' do
      expect(response).to have_http_status(201)
      expect(JSON.parse(response.body)['material_name']).to eq('Lumber')
      expect(JSON.parse(response.body)['description']).to eq('Pine wood for construction')
    end
  end

  context 'when the request is invalid' do
    before { post '/materials', params: { material_name: 'Foam' }, headers: headers }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end

    it 'returns a validation failure message' do
      expect(response.body).to match(/can't be blank/)
    end
  end
end

  describe 'PUT /materials/:id' do
    let(:material) { create(:material) } 
    let(:material_id) { material.id } 
    let(:valid_attributes) { { material_name: 'Updated Name', description: 'Updated description' } } 
  
    context 'when the record exists' do
      before { put "/materials/#{material_id}", params: valid_attributes, headers: headers }
  
      it 'updates the record' do
        expect(response).to have_http_status(204)
        updated_material = Material.find(material_id)
        expect(updated_material.material_name).to eq('Updated Name')
        expect(updated_material.description).to eq('Updated description')
      end
    end
  end

describe 'DELETE /materials/:id' do
  before { delete "/materials/#{material_id}", headers: headers }

  it 'returns status code 204' do
    expect(response).to have_http_status(204)
  end

  it 'deletes the material' do
    expect(Material.find_by(id: material_id)).to be_nil
  end
end
end
