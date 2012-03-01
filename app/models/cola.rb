class Cola < ActiveRecord::Base
  has_one :exam
  has_one :prestacion
end
