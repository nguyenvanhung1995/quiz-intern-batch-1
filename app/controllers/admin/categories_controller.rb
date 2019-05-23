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
    @category_old_name = @category.name
    if @category.update_attributes(category_params)
      flash[:success] = "Changed from #{@category_old_name}  to new name #{@category.name} success!"
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
  
  private

  def category_params
    params.require(:category).permit(:name)
  end
end
