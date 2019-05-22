class Admin::QuestionsController < ApplicationController
  before_action :get_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show; end

  def new
    @question = Question.new
    4.times { @question.answers.build }
  end

  def create
    @question = Question.new question_params
    if check_correct
      if @question.save
        flash[:success] = "Create question success!"
        redirect_to admin_questions_path
      else
        render :new
      end
    else
      flash.now[:danger] = "The question has only one answer!"
      render :new
    end
  end

  def edit; end

  def update
    if check_correct && @question.update_attributes(question_params)
      flash[:success] = "Update question success!"
      redirect_to admin_questions_path
    else
      flash.now[:danger] = "Please check your answer again!" 
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:danger] = "Delete question success!"
      redirect_to admin_questions_path
    end
  end

  private

  def question_params
    params.require(:question).permit :content, :image, :category_id, 
      answers_attributes: [:id, :content, :is_correct]
  end

  def get_question
    @question = Question.find params[:id]
  end

  def check_correct
    arr = []
    params[:question][:answers_attributes].each{|k, v| arr << v[:is_correct]}
    arr.count("1") == 1
  end
end
