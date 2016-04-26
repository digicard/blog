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

  def edit
    @articulo = Articulo.find(params[:id])
    authorize @articulo
  end

  def update
    @articulo = Articulo.find(params[:id])
    if @articulo.update_attributes(articulo_params)
      redirect_to :action => 'show' , :id => @articulo.id
    end
  end

  def destroy
    Articulo.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  private

  def articulo_params
    params.require(:articulo).permit(:titulo, :texto)
   end
end
