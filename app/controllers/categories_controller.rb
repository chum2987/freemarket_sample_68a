class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def create
  end
end
