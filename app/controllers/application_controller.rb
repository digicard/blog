class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale, :authenticate_usuario!

  def set_locale
    puts params.inspect
    set_new_locale(params[:locale_new]) if params.has_key?(:locale_new)
    puts current_usuario.inspect
  	# I18n.locale = params[:locale] || I18n.default_locale
    I18n.locale = current_usuario.present? ? current_usuario.preferred_language : I18n.default_locale
  end

  def set_new_locale(langague)
    current_usuario.preferred_language = langague
    current_usuario.save(validate: false)
  end
  
end
