class Exam < ActiveRecord::Base
  has_many :colas
  belongs_to :patient
  belongs_to :prestacion, :foreign_key => :prestacion_id, :primary_key => :cod_prestacion
end
