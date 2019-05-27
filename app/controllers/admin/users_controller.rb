class Admin::UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
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
      flash[:success] = "Update success !"
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted "
    redirect_to admin_users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit :name, :birthday, :address, :email, :role, :password
  end

end
