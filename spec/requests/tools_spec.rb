require 'rails_helper'

RSpec.describe 'Tools API', type: :request do
  let(:tools) { create_list(:tool, 10) }
  let(:tool_id) { tools.first.id }
  let(:user) { create(:user) }
  let(:token) { auth_token_for_user(user) }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }

  before { tools }
  
  describe 'GET /tools' do
    before { get '/tools', headers: headers }

    it 'returns tools' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /tools/:id
  describe 'GET /tools/:id' do
    before { get "/tools/#{tool_id}", headers: headers }

    context 'when the record exists' do
      it 'returns the tool' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(tool_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:tool_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /tools' do
    let(:valid_attributes) { { tool: { tool_name: 'Drill', description: 'A tool for making holes' } } }
  
    context 'when the request is valid' do
      before { post '/tools', params: valid_attributes, headers: headers }
  
      it 'creates a tool' do
        expect(response).to have_http_status(201)
        expect(json['tool_name']).to eq('Drill')
        expect(json['description']).to eq('A tool for making holes')
      end
    end
  
    context 'when the request is invalid' do
      before { post '/tools', params: { tool: { tool_name: 'Drill' } }, headers: headers } 
    
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    
      it 'returns a validation failure message' do
        expect(response.body).to include("\"description\":[\"can't be blank\"]")
      end
    end
    
  end

  describe 'PUT /tools/:id' do
    let(:valid_attributes) { { tool: { tool_name: 'Updated Drill', description: 'An updated tool for making holes' } } } 

    context 'when the record exists' do
      before { put "/tools/#{tool_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response).to have_http_status(204)
        updated_tool = Tool.find(tool_id)
        expect(updated_tool.tool_name).to eq('Updated Drill')
        expect(updated_tool.description).to eq('An updated tool for making holes')
      end
    end
  end

  describe 'DELETE /tools/:id' do
    before { delete "/tools/#{tool_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'deletes the tool' do
      expect { Tool.find(tool_id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end