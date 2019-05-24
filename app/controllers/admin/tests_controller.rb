class Admin::TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find params[:id]
  end
end
