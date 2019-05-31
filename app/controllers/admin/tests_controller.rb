class Admin::TestsController < Admin::BaseController
  before_action :authorize, only: [:index, :show]
  def index
    @tests = Test.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @test = Test.find params[:id]
  end
end
