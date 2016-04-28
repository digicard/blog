class ArticuloPolicy < ApplicationPolicy
  attr_reader :usuario, :articulo

  def initialize(usuario, articulo)
    @usuario = usuario
    @articulo = articulo
  end

  def edit?
  	@usuario.id == @articulo.usuario_id
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
