class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @items = @category.items.all
  end
end
