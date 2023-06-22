class RecipesController < ApplicationController
  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
    # @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  # GET /recipes/1 or /recipes/1.json

  def show
    @recipe = Recipe.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to user_recipes_path(@user), notice: 'Recipe created successfully' }
      else
        format.html { render :new }
      end
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
    if @recipe.update(public: !@recipe.public)
      redirect_to user_recipe_path(@recipe.user, @recipe), notice: 'Recipe status updated'

    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
