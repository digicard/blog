class V1::ArticuloController < V1::BaseController
  before_filter :find_articulo, only: [:update]


  def index
    render json: Articulo.order(id: :ASC).page(params[:pag])
  end

  def update
    if @articulo.update_attributes(articulo_params)
        render json: @articulo
    else
        render nothing: true, status: :bad_request
    end
  end

  def articulo_params
    params.require(:art).permit(:titulo, :texto)
  end

  private
   def find_articulo
     @articulo = Articulo.find(params[:id])
     render nothing: true, status: :not_found unless @articulo.present? && @articulo.usuario_id == current_usuario.id
   end
end
