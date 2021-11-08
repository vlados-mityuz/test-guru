class FeedbackController < ApplicationController

  def index; end

  def create
    FeedbackMailer.send_feedback_message(feedback_params) unless feedback_params[:message].empty?
    redirect_to root_path, notice: t('.notice')
  end

  private

  def feedback_params
    params.permit(:message)
  end
end
