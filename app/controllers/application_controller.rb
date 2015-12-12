class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ##############################################################################
  # Set locale according to the selected value in a View (see ApplicationHelper)
  #
  # 17.11.2013
  # 27.11.2013  Last update ('es' added)
  ##############################################################################
  def set_locale
    if    params[:locale] == "ru"
      I18n.locale = :ru
    elsif params[:locale] == "es"
      I18n.locale = :es
    else
      I18n.locale = :en
    end
  end
end
