class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale, :authenticate_usuario!

  def set_locale
    I18n.locale = current_usuario.present? ? current_usuario.preferred_language : I18n.default_locale
  end

  def set_new_locale
    current_usuario.preferred_language = params[:format]
    current_usuario.save(validate: false)
    redirect_to :back
  end
end
