class Admin::DashboardsController < Admin::BaseController
  before_action :authorize, only: :index
  def index; end
end
