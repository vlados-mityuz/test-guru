class ApplicationController < ActionController::Base

  before_action :set_locale

  def default_url_options
    { lang: (I18n.locale if I18n.locale != I18n.default_locale) }
  end

  private
  
  def after_sign_in_path_for(resource)
    resource.admin? ? admin_tests_path : super
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
