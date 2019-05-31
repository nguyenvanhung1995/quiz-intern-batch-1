class Admin::QuestionsController < Admin::BaseController
  before_action :get_question, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:show, :destroy, :update, :edit, :index]
  def index
    @questions = Question.all.paginate(page: params[:page], per_page: 10)
  end

  def show; end

  def new
    @question = Question.new
    4.times { @question.answers.build }
  end

  def create
    @question = Question.new question_params
    if @question.valid? && check_correct
      @question.save
      flash[:success] = "Create question success!"
      redirect_to admin_questions_path
    else
      flash.now[:danger] = "The question has only one answer!"
      render :new
    end
  end

  def edit; end

  def update
    @question.assign_attributes(question_params)
    if check_correct && @question.valid?
      @question.save
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
    params.require(:question).permit :content, :image, :image_cache, 
      :category_id, answers_attributes: [:id, :content, :is_correct]
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
