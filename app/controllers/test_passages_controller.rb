class TestPassagesController < ApplicationController
  before_action :authenticate_user!, only: %i[update]
  before_action :set_test_passage, only: %i[show update result gist]

  def show
    redirect_if_time_expired
  end

  def result

  end

  def gist
    new_gist = GistQuestionService.new(@test_passage.current_question)
    result = new_gist.call

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
      redirect_if_time_expired
      @test_passage.update_test_passage_status
      assign_badges
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def assign_badges
    BadgesForUsersServices.new(@test_passage.id).call
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def redirect_if_time_expired
    return unless @test_passage.remaining_time <= 0

    redirect_to(result_test_passage_path(@test_passage), alert: 'Time is over')
  end
end
