class HardWorker
  include Sidekiq::Worker
  def perform(usuario_mail)
    UsuarioMailer.ultimos_diez_usuarios_recientes(usuario_mail).deliver_now;
  end
end