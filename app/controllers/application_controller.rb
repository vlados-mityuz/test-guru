class ApplicationController < ActionController::Base

  private
  
  def after_sign_in_path_for(resource)
    resource.admin? ? admin_tests_path : super
  end

end
