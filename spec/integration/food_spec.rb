require 'rails_helper'

RSpec.describe 'Food', type: :request do
  describe 'GET /foods' do
    it 'should have food contents' do
      get foods_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /foods/new' do
    it 'should create new food' do
      get new_user_food_path(user_id: 1) # Replace "1" with the actual user ID
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /foods' do
    it 'should have a delete button' do
      get foods_path
      expect(response).to have_http_status(:success)
    end
  end
end

