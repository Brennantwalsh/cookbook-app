class RecipesController < ApplicationController
  def one
    @recipe = Recipe.find(2)
  end
end
