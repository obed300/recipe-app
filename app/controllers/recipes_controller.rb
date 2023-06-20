class RecipesController < ApplicationController

    #GET /recipes or /recipes.json
    def index
        @recipes = current_user.recipes
    end

    #GET /recipes/1 or /recipes/1.json

    def show
        @ingredients = RecipeFood.includes(:food).where(recipe_id: params[:id])
    end

end
