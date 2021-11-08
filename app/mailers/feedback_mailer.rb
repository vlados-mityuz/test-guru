def send_feedback_message(params)
  @name = current_user.first_name
  @email = current_user.email
  @message = params[:email]

  mail to: thenoma1@gmail.com
end