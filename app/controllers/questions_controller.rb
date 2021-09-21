class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy, :edit, :update]
  before_action :find_test, only: [:index, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.delete
    render plain: "Вопрос удалён"
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Запись c id: #{params[:id]} не найдена."
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
