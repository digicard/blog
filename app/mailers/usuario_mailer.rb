class UsuarioMailer < ApplicationMailer
	default from: 'blog@ruby.com'

	def ultimos_diez(usuario)
		@usuario = usuario
		@articulos = Articulo.last(10).reverse
		mail(to: @usuario.email , subject: 'Ultimos 10 registros')
		return true;
	end
end
