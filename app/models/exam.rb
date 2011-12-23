class Exam < ActiveRecord::Base
  belongs_to :patient
  belongs_to :prestacion
end
