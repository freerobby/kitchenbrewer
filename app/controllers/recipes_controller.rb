class RecipesController < ApplicationController
  before_filter :load_recipe, :only => [:show, :edit, :update, :destroy]
  access_control do
    allow anonymous, :to => [:index, :show]
    allow logged_in, :to => [:index, :show, :new, :create]
    allow :owner, :of => :recipe, :to => [:edit, :update, :destroy]
  end
  uses_tiny_mce
  
  def index
    @search = Recipe.search(params[:search])
    @recipes = @search.all
  end
  
  def show
  end
  
  def new
    @recipe = @current_user.recipes.build
  end

  def create
    @recipe = @current_user.recipes.build(params[:recipe].merge(:author_id => @current_user.id))
    if @recipe.save
      flash[:notice] = 'Your recipe has been created.'
      redirect_to edit_recipe_path(@recipe)
    else
      render :action => :new
    end
  end
  
  def edit
    10.times {@recipe.recipe_ingredients.build}
  end

  def update
    if @recipe.update_attributes(params[:recipe])
      flash[:notice] = 'Your recipe has been updated.'
      redirect_to recipe_path(@recipe)
    else
      render :action => :edit
    end
  end
  
  def destroy
    @recipe.destroy
    flash[:notice] = "Your recipe has been removed."
    redirect_to recipes_path
  end
  
  private
  def load_recipe
    @recipe = Recipe.find(params[:id])
  end
end
