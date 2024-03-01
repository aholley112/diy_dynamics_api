require 'rails_helper'

RSpec.describe "ProjectMaterials", type: :request do
  let(:user) { create(:user) }
  let(:token) { auth_token_for_user(user) }
  let(:headers) { { "Authorization" => "Bearer #{token}" } }

  let!(:project) { create(:project) }
  let!(:material) { create(:material) }
  let!(:project_materials) { create_list(:project_material, 10, project: project, material: material) }
  let(:project_material_id) { project_materials.first.id }

  # Test for GET /project_materials - List all project materials
  describe 'GET /project_materials' do
    before { get '/project_materials', headers: headers }

    it 'returns project materials' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
      expect(response).to have_http_status(:ok)
    end
  end

  # Test for POST /project_materials - Create a new project material
  describe 'POST /project_materials' do
    let(:valid_attributes) { { project_id: project.id, material_id: material.id, quantity_needed: 5, price: 100.0 }.to_json }

    context 'when the request is valid' do
      before { post '/project_materials', params: valid_attributes, headers: headers }

      it 'creates a project material' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the request is invalid' do
      before { post '/project_materials', params: { project_id: nil }.to_json, headers: headers }

      it 'does not create project material' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  # Test for PUT /project_materials/:id - Update project material
  describe 'PUT /project_materials/:id' do
    let(:valid_attributes) { { quantity_needed: 10, price: 150.0 }.to_json }

    before { put "/project_materials/#{project_material_id}", params: valid_attributes, headers: headers }

    it 'updates the project material' do
      updated_project_material = ProjectMaterial.find_by(id: project_material_id)
      expect(response).to have_http_status(:ok)
      expect(updated_project_material.quantity_needed).to eq(10)
      expect(updated_project_material.price).to eq(150.0)
    end
  end

  # Test for DELETE /project_materials/:id - Delete project material
  describe 'DELETE /project_materials/:id' do
    before { delete "/project_materials/#{project_material_id}", headers: headers }

    it 'deletes the project material' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
