require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  before(:each) do
    @user = User.create(name: 'Obed', email: 'Obedan@gmail.com', password: '123456', password_confirmation: '123456')
    @recipe = Recipe.create(name: 'vanilla', preparation_time: 1, cooking_time: 2, description: 'One of a kind', public: true, user_id: @user.id)
    @food = Food.create(name: 'beans', measurement_unit: 'percs', price: 12, quantity: 22, user_id: @user.id)
    @recipe_food = RecipeFood.create(quantity: 30, food_id: @food.id, recipe_id: @recipe.id)
  end

  describe 'GET /users/:user_id/recipes/:recipe_id/recipe_foods/new' do
    it 'returns http success' do
      get new_user_recipe_recipe_food_path(@user, @recipe)
      expect(response).to have_http_status(:success)
    end
  end
end
