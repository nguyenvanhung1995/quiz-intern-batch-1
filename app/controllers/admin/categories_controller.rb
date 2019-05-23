class Admin::CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Added new category success!"
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Update category's name success!"
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end
  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to admin_categories_path
  end
  # def show
  #   @category = Category.find(params[:id])
  # end
  private
  def category_params
    params.require(:category).permit(:name)
  end
end
