class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy]
  before_action :find_test, only: [:index, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render inline: "<% @questions.each do |question| %> id:<%= question.id %> / <%= question.body %> %>"
  end

  def new
  end

  def show
    render inline: 'ID: <%= @question.id %> -- <%= @question.body %><li><%= button_to 'Destroy', question_path(q), :method => :delete %>'
  end

  def create
    @question = @test.questions.new(question_params)
    if question.save
      render plain: question.inspect
    else
      render :new
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
