require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let!(:user) { create(:user) }
  let!(:categories) { create_list(:category, 5) }
  let(:category_id) { categories.first.id }
  let(:token) { auth_token_for_user(user) }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }

  # Test for GET /categories. Index category
  describe "GET /index" do
    before { get '/categories', headers: headers }

    it 'returns all categories' do
      expect(json.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
  end

  # Test for GET /categories/:id. Show category
  describe 'GET /categories/:id' do
    before { get "/categories/#{category_id}", headers: headers }

    it 'returns the category' do
      expect(json['id']).to eq(category_id)
      expect(response).to have_http_status(:ok)
    end
  end

  # Test for POST /categories. Create category
  describe 'POST /categories' do
    let(:valid_attributes) { { category_name: 'New Category', description: 'A new category description' } }

    context 'when request attributes are valid' do
      before { post '/categories', params: valid_attributes, headers: headers }

      it 'creates a new category' do
        expect(response).to have_http_status(:created)
        expect(json['category_name']).to eq('New Category')
        expect(json['description']).to eq('A new category description')
      end
    end

    context 'when the request is invalid' do
      before { post '/categories', params: { category_name: '' }, headers: headers }

      it 'does not create a category' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  # Test for PUT /categories/:id. Update category
  describe 'PUT /categories/:id' do
    let(:valid_attributes) { { category_name: 'Updated Category', description: 'Updated category description' } }

    before { put "/categories/#{category_id}", params: valid_attributes, headers: headers }

    it 'updates the category' do
      expect(response).to have_http_status(:ok)
      category = Category.find(category_id)
      expect(category.category_name).to eq('Updated Category')
      expect(category.description).to eq('Updated category description')
    end
  end

  # Test for DELETE /categories/:id. Delete category
  describe 'DELETE /categories/:id' do
    let!(:category_to_delete) { create(:category) }
    let(:category_id_to_delete) { category_to_delete.id }

    before { delete "/categories/#{category_id_to_delete}", headers: headers }

    it 'deletes the category and returns status code 204' do
      expect(response).to have_http_status(:no_content)
      get "/categories/#{category_id_to_delete}", headers: headers
      expect(response).to have_http_status(:not_found)
    end
  end 
end 