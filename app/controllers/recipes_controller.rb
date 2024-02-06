class RecipesController < ApplicationController
  # before_action :set_recipe, only: [:show, :destroy, :public_recipes]
  before_action :set_recipe, only: %i[show destroy]
  load_and_authorize_resource

  def index
    @recipes = Recipe.all
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = curent_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully create'
    else
      render :new
    end
  end

  def destroy
    if @recipe.destroy
      redirect_to recipes_url, notice: 'Recipe was succesfully destroyed'
    else
      redirect_to recipes_url, alert: 'Yo cannot delete this recipe'
    end
  end

  def public_recipes
    # @recent_public_recipes = Recipe.where(public: true).order(created_at: :desc)
    @recent_public_recipes = Recipe.recent_public
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
