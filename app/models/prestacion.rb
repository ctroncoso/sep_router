class Prestacion < ActiveRecord::Base
  has_many :exams, :foreign_key => :prestacion_id, :primary_key=> :cod_prestacion
  belongs_to :punto_servicio
end
