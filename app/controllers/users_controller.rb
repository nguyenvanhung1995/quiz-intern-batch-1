class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update]
  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = "Sign up successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Update success !"
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :birthday, :address, :email, 
      :password, :password_confirmation, :image
  end

  def get_user
    @user = User.user.find_by id: params[:id]
  end
end
