class V1::ArticuloPresenter < V1::BasePresenter

  def initialize(articulo)
    @articulo = articulo
  end

  def as_json(options={})
    # fill me in...
  end

  def to_xml(options={}, &block)
    xml = options[:builder] ||= Builder::XmlMarkup.new
    # fill me in...
  end
end
