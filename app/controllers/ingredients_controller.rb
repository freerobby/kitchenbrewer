class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.title_like(params[:search])
  end
end