class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all 
  end

  def new
  end

  def create
    @recipe = Recipe.create(title: params[:title], 
                            chef: params[:chef], 
                            prep_time: params[:prep_time],
                            ingredients: params[:ingredients],
                            directions: params[:directions])

    render 'show.html.erb'
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
