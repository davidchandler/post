class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))
    if @category.save
      redirect_to root_path, notice: "New category created!"
    else
      render :new
    end
  end
end
