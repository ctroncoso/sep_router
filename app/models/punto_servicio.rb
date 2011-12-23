class PuntoServicio < ActiveRecord::Base
  has_many :prestacions
  has_many :exams
end
