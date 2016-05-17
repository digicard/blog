class ApiArticulosController < BaseApiController
  before_filter :find_articulo, only: [:update]

  # before_filter only: :update do
  #   unless @json.has_key?('articulo')
  #     render nothing: true, status: :bad_request
  #   end
  # end

  def index
    render json: Articulo.order(id: :ASC).page(params[:pag])
  end

  # def update
  #   @articulo.assign_attributes(@json['articulo'])
  #   if @articulo.save
  #       render json: @articulo
  #   else
  #       render nothing: true, status: :bad_request
  #   end
  # end

 private
   def find_articulo
     @articulo = articulo.find_by_name(params[:name])
     render nothing: true, status: :not_found unless @articulo.present? && @articulo.usuario == @usuario
   end
 end
