class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: [:start]

  def index
    @tests = Test.all
  end


  def start
    if @test.questions.any?
      if @test.questions.count == 1 && @test.questions.first.answers.empty?
        redirect_to tests_path, alert: t('.rescue.no_answers')
      else
        current_user.tests.push(@test)
        redirect_to current_user.test_passage(@test)
      end
    else
      redirect_to tests_path, alert: t('.rescue.no_questions')
    end
  end

  private 

  def find_test
    @test = Test.find(params[:id])
  end
end
