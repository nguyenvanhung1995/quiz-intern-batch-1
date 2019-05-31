class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: [:show, :destroy, :update, :edit]
  before_action :authorize, only: [:show, :destroy, :update, :edit, :index]
  before_action :admin_user, only: :destroy
  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Added new user : #{@user.name} success !"
      redirect_to admin_users_path
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Update successfully!"
      redirect_to admin_users_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted !"
    redirect_to admin_users_url
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit :name, :birthday, :address, :email, :role,
    :password, :password_confirmation, :image, :image_cache
  end

  def admin_user
    redirect_to(admin_root_url) unless current_user.admin?
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(admin_root_path) unless current_user?(@user)
  end
end
