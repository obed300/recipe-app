require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
    @recipe = Recipe.create(name: 'vanilla', preparation_time: 1, cooking_time: 2, description: 'One of a kind', public: true, user_id: @user.id)
  end

  describe 'GET /recipes' do
    it 'returns http success' do
      get user_recipes_path(@user)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /recipes/new' do
    it 'returns http success' do
      get new_user_recipe_path(@user)
      expect(response).to have_http_status(:success)
    end
  end
end
