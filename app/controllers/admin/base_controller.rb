class Admin::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  layout "admin"
  include SessionsHelper
  include UsersHelper
  
  def authorize
    unless logged_in?
      redirect_to admin_login_path
      flash[:danger] = "You must login first !"
    end
  end
end
