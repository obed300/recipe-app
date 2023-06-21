class RecipesController < ApplicationController
  # GET /recipes or /recipes.json
  def index
    @recipes = current_user.recipes
  rescue NoMethodError
    redirect_to new_user_session_path
  end

  # GET /recipes/1 or /recipes/1.json

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to user_recipes_path, notice: 'Recipes created successfully'
    else
      render :new
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])

    if @recipe.destroy
      redirect_to user_recipes_path, notice: 'Recipe has been removed'
    else
      redirect_to user_recipes_path, notice: 'Recipe could not be deleted'
    end
  end
   
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.public = !@recipe.public
    @recipe.save
    redirect_to recipe_path(@recipe), notice: 'Recipe status updated'
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
