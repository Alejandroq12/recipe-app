class ShoppingListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_data

  def index
    @shopping_list = calculate_general_shopping_list
  end

  private

  def set_user_data
    @recipes = Recipe.all 
    @recipes_food = @recipes.flat_map(&:recipe_foods)
    @foods = Food.all
  end

  def calculate_general_shopping_list
    shopping_list = []

    @foods.each do |food|
      recipe_food_items = @recipes_food.select { |rf| rf.food_id == food.id }
      total_recipe_quantity = recipe_food_items.sum(&:quantity)
      total_user_quantity = food.quantity

      if total_recipe_quantity > total_user_quantity
        difference = total_recipe_quantity - total_user_quantity
        shopping_list << { food_name: food.name, difference:, price: food.price }
      end
    end

    shopping_list
  end
end
