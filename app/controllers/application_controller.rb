class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :set_locale
  before_filter :take_stamp


  def take_stamp
    @stamp = Time.new
  end

  def set_locale
    I18n.locale = params[:locale]
  end

end
