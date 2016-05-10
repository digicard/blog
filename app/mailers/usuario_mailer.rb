class UsuarioMailer < ApplicationMailer
	default from: 'blog@ruby.com'

	def ultimos_diez(usuario)
		@usuario = usuario
		@articulos = Articulo.last(10).reverse
		mail(to: @usuario.email , subject: 'Ultimos 10 registros')
		return true;
	end

	def ultimos_diez_usuarios_recientes(usuario_mail)
		@articulos = Articulo.select('articulos.*, usuarios.email').joins(:usuario).order("usuarios.id DESC").limit(10)
		puts @articulos.inspect
		mail(to: usuario_mail , subject: 'Ultimos 10 registros')
	end
end
