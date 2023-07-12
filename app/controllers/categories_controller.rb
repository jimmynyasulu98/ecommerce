class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.create(message_params)
    if @category.valid?
      redirect_to  root_path
    else
      render "new"
    end
  end

  private
  def message_params
    params.require(:category).permit(:name)
  end

end
