# require 'rails_helper'

# RSpec.describe "ProjectMaterials", type: :request do
#   let!(:user) { create(:user) }
#   let(:token) { auth_token_for_user(user) }
#   let(:headers) { { 'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json' } }
#   let!(:project_material) { create(:project_material) }  
#   let!(:project) { create(:project) }  
#   let!(:material) { create(:material) }  

#   let(:valid_attributes) {
#     {
#       project_id: 2,
#       material_id: 2,
#       quantity_needed: 10,
#       price: 200.0
#     }.to_json
#   }

#   describe 'POST /project_materials' do
#     context 'when the request attributes are valid' do
#       before { post '/project_materials', params: valid_attributes, headers: headers }

#       it 'creates a new project material' do
#         expect(response).to have_http_status(:created)
#       end
#     end
#   end

#   # PUT
# end
