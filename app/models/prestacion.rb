class Prestacion < ActiveRecord::Base
  has_many :exam
  belongs_to :puntoservicio
end
