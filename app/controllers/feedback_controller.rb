class FeedbackController < ApplicationController

  def index; end

  def create
    FeedbackMailer.send_feedback_message(params) unless params[:message].nil?
    redirect_to root_path, notice: t('.notice')
  end
end