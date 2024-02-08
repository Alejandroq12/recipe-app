class RecipesController < ApplicationController
  # before_action :set_recipe, only: [:show, :destroy, :public_recipes]
  before_action :set_recipe, only: %i[show  destroy]
  load_and_authorize_resource
  before_action :authenticate_user!

  # GET /recipes or /recipes.json
  def index
    @recipes = current_user.recipes
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @foods = Food.all
  end

  # GET /recipes/new
  def new
    @recipe = current_user.recipes.build
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @recipe.destroy
      redirect_to recipes_url, notice: 'Recipe was successfully destroyed'
    else
      redirect_to recipes_url, alert: 'You cannot delete this recipe'
    end
  end
  def toggle_recipe
    @recipe = current_user.recipes.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe, notice: 'Recipe status toggled successfully.'
  end
  def public_recipes
    # @recent_public_recipes = Recipe.where(public: true).order(created_at: :desc)
    @recent_public_recipes = Recipe.recent_public.includes(:user)
  end

  private

  def set_recipe
    @recipe = if params[:id] == 'public_recipes'
                # No need to find a recipe when displaying public recipes
                nil
              else
                # Find the recipe by its id
                current_user.recipes.find(params[:id])
              end
  end
  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
