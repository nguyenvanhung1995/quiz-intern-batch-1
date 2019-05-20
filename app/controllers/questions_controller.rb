class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find_by id: params[:id]
  end

  def new
    @question = Question.new
    4.times { @question.answers.build }
  end

  def create
    @question = Question.create question_params
    if @question.save
      byebug
      redirect_to questions_path
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit :content, :image, :category_id, 
      answers_attributes: [:id, :content, :is_correct]
  end
end
