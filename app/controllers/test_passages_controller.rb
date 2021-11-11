class TestPassagesController < ApplicationController
  before_action :authenticate_user!, only: %i[update]
  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def gist
    new_gist = GistQuestionService.new(@test_passage.current_question)
    new_gist.call

    if new_gist.success?
      current_user.gists.create(question: @test_passage.current_question, url: result.html_url )
      flash_options = { notice: t('.success', url: result.html_url) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
