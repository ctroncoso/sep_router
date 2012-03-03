class Cola < ActiveRecord::Base
  belongs_to :exam
  belongs_to :prestacion

  def self.hours_ago(hours=nil)
    if hours.nil?
      where(:created_at => (Time.now.midnight)..Time.now )
    else
      where(:created_at => ( Time.now - hours.to_i.hours)..Time.now )
    end
  end

  def self.of_today
    self.hours_ago
  end

  def self.of_date(fecha)
    date = Time.parse(fecha)
    where(:colas => {:created_at => date.midnight..(date.midnight+1.day) } )
  end

  def self.find_by_ps(punto_servicio_id)
    joins(:prestacion => :punto_servicio).where(:punto_servicios => {:id => punto_servicio_id})
  end
  
  def self.patients_by_punto_servicio(punto_servicio_id)
    find_by_ps(punto_servicio_id).includes(:exam => :patient).map{|e| e.exam.patient}.uniq
  end

  def self.exams_by_punto_servicio_and_rut(punto_servicio_id, rut)
    find_by_ps(punto_servicio_id).joins(:exam => :patient).where(:patients => {:rut => rut})
    # para obtener lista 
    # r.map {|e| [e.id, e.exam.prestacion.descripcion, e.prestacion.punto_servicio.descripcion, e.exam.patient.name]}
  end


end
