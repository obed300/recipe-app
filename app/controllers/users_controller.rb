class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def shopping_list
    @all_recipes = Recipe.all
    @recipes = current_user.recipes.includes(:foods)
    @general_foods = current_user.foods

    @missing_foods = calculate_missing_foods
    @total_count = @missing_foods.length
    @total_price = calculate_total_price(@missing_foods)
  end


  def show
    @user = User.find(params[:id])
  end
end
