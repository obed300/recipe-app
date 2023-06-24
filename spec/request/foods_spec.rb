require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  before(:each) do
    @user = User.create(name: 'Obed', email: 'Obed@gmail.com', password: '123456', password_confirmation: '123456')
    @recipe = Recipe.create(name: 'josue', preparation_time: 1, cooking_time: 2, description: 'One of a kind', public: true, user_id: @user.id)
    @food = Food.create(name: 'beans', measurement_unit: 'percs', price: 12, quantity: 22, user_id: @user.id)
    @recipe_food = RecipeFood.create(quantity: 30, food_id: @food.id, recipe_id: @recipe.id)
  end

  describe 'GET /users/:user_id/foods/new' do
    it 'returns http success' do
      get new_user_food_path(user_id: @user.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /users/:user_id/foods/new' do
    it 'renders the new template' do
      get new_user_food_path(user_id: @user.id)
      expect(response).to render_template('foods/new')
    end
  end
end
