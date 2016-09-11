class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all 
    sort_attribute = params[:sort]
    
    if sort_attribute
      @recipes = @recipes.order(sort_attribute) 
    end
  end

  def new
  end

  def create
    @recipe = Recipe.create(title: params[:title], 
                            chef: params[:chef], 
                            prep_time: params[:prep_time],
                            ingredients: params[:ingredients],
                            directions: params[:directions])

    flash[:success] = 'New recipe created'
    redirect_to "/recipes/#{@recipe.id}"
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(title: params[:title],
                   chef: params[:chef],
                   prep_time: params[:prep_time],
                   ingredients: params[:ingredients],
                   directions: params[:directions])

    flash[:success] = "Updated"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    flash[:warning] = "Recipe deleted"
    redirect_to '/recipes'
  end
end
