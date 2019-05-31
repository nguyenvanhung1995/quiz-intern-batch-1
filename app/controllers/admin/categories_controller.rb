class Admin::CategoriesController < Admin::BaseController
  before_action :find_category, only: [:edit, :update, :destroy]
  before_action :authorize, only: [:show, :destroy, :update, :edit, :index]
  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 10)
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
      render "new"
    end
  end

  def edit
  end

  def update
    category_old_name = @category.name
    if @category.update_attributes(category_params)
      flash[:success] = "Changed from #{category_old_name} to new name #{@category.name} success!"
      redirect_to admin_categories_path
    else
      render "edit"
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Category deleted"
    redirect_to admin_categories_path
  end
  
  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
