class TestsController < ApplicationController
  before_action :get_category, only: [:new, :create]

  def show
    @test = Test.find params[:id]
  end

  def new
    @test = Test.new
    @test.detail_tests.build
  end

  def create
    @test = Test.new test_params
    @test.result = check_answer
    if @test.save
      redirect_to category_test_path(@category.id, @test)
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit :result, 
      detail_tests_attributes: [:id, :answer_id, :question_id]
  end

  def get_category
    @category = Category.find params[:category_id]
  end

  def check_answer
    @test.detail_tests.select{ |key| key.is_correct }.size
  end
end
