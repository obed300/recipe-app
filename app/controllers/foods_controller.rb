class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @food = Food.new
  end

  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.new(food_params)

    respond_to do |format|
      format.html do
        if @food.save
          redirect_to user_foods_path(@user), notice: 'Food was successfully created.'
        else
          render :new
        end
      end
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    @food.destroy
    redirect_to user_foods_path(params[:user_id]), notice: 'Food was successfully destroyed.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
