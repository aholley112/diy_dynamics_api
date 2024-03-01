require 'rails_helper'

RSpec.describe "Materials", type: :request do
let(:user) { create(:user) } 
let!(:materials) { create_list(:material, 10) }
let(:material_id) { materials.first.id }
let(:token) { auth_token_for_user(user) } 
let(:headers) { { "Authorization" => "Bearer #{token}" } }

# Test for GET /materials. Index materials
describe 'GET /materials' do
  before { get '/materials', headers: headers }

  it 'returns materials' do
    expect(json).not_to be_empty
    expect(json.size).to eq(10)
    expect(response).to have_http_status(:ok)

  end
end

# Test for GET /materials/:id. Show material
describe 'GET /materials/:id' do
  before { get "/materials/#{material_id}", params: {}, headers: headers }

  it 'returns the material' do
    expect(json).not_to be_empty
    expect(json['id']).to eq(material_id)
    expect(response).to have_http_status(:ok)
  end
end

# Test for POST /materials. Create material
describe 'POST /materials' do
let(:valid_attributes) { { material_name: 'Lumber', description: 'Pine wood for construction' } }

context 'when the request is valid' do
  before { post '/materials', params: valid_attributes, headers: headers }

  it 'creates a material' do
    expect(response).to have_http_status(:created)
  end
end

context 'when the request is invalid' do
  before { post '/materials', params: { material_name: nil }.to_json, headers: headers }

  it 'does not create material' do
    expect(response).to have_http_status(:unprocessable_entity)
  end
  end
end

# Test for PUT /materials/:id. Update material
describe 'PUT /materials/:id' do
  let(:valid_attributes) { { material_name: 'Updated Material', description: 'Updated Description' } }

  before { put "/materials/#{material_id}", params: valid_attributes, headers: headers }

  it 'updates the material' do
    updated_material = Material.find_by(id: material_id)
    expect(response).to have_http_status(:ok)
    expect(updated_material.material_name).to eq('Updated Material')
    expect(updated_material.description).to eq('Updated Description')
  end
end

# Test for DELETE /materials/:id. Delete material
describe 'DELETE /materials/:id' do
before { delete "/materials/#{material_id}", headers: headers }

it 'deletes the material' do
  expect(response).to have_http_status(:no_content)
end
end
end
