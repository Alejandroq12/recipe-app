class FoodsController < ApplicationController
  load_and_authorize_resource

  def index
    @foods = Food.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_url, notice: 'Food was successfully created.' }
        format.json { render :index, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update; end

  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfuly deleted' }
      format.json { head :no_content }
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
