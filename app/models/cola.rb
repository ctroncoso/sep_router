class Cola < ActiveRecord::Base
  belongs_to :exam
  belongs_to :prestacion

  def self.of_today
    where(:created_at => (Time.now.midnight)..Time.now)
  end

  def self.find_by_ps(punto_servicio_id)
    joins(:prestacion => :punto_servicio).where(:punto_servicios => {:id => punto_servicio_id})
  end
  
  def self.patients_by_punto_servicio(punto_servicio_id)
    find_by_ps(punto_servicio_id).map{|e| e.exam.patient}.uniq
  end

  def self.exams_by_punto_servicio_and_rut(punto_servicio_id, rut)
    find_by_ps(punto_servicio_id).joins(:exam => :patient).where(:patients => {:rut => rut})
    # para obtener lista 
    # r.map {|e| [e.id, e.exam.prestacion.descripcion, e.prestacion.punto_servicio.descripcion, e.exam.patient.name]}
  end


end
