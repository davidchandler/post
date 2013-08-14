class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end

  def create
    #binding.pry
    @category = Category.find(params[:id])
      

    if @category.save
      redirect_to category_path(@category), notice: "Category was created!"
    else
      render 'posts/show'
    end
  end
end