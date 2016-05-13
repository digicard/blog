class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :set_locale, :authenticate_usuario!

  include Pundit
  
  def set_locale
    I18n.locale = current_usuario.present? ? current_usuario.preferred_language : I18n.default_locale
  end

  def set_new_locale
    current_usuario.preferred_language = params[:format]
    current_usuario.save(validate: false)
    redirect_to :back
  end

  def enviar_sumario
    @mailEnviado = UsuarioMailer.ultimos_diez(current_usuario).deliver_now;
    redirect_to :back
  end

  def enviar_sumario_nuevos_usuarios
    MailWorker.perform_async(current_usuario.email)
    redirect_to :back
  end

  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  private

  def permission_denied
    redirect_to(request.referrer || root_path)
  end

end
