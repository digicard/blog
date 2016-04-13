class ArticulosController < ApplicationController
  def index
    @articulos = Articulo.all
  end

  def new
  end

  def show
    @articulo = Articulo.find(params[:id])
  end

  def create
    @articulo = Articulo.new(articulo_params)
    @articulo.save
    redirect_to @articulo
  end

  private

  def articulo_params
    params.require(:articulo).permit(:titulo, :texto)
   end
end
