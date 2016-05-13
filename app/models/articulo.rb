class Articulo < ActiveRecord::Base
  belongs_to :usuario
  paginates_per 50
end
