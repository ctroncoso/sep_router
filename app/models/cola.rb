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

  def self.pending
    where("colas.finished_at is null")
  end

  def self.finished
    where("colas.finished_at is not null")
  end
    
  def self.find_by_ps(punto_servicio_id)
    includes(:prestacion => :punto_servicio).where(:punto_servicios => {:id => punto_servicio_id})
  end
  
  def self.patients_by_punto_servicio(punto_servicio_id, s = :pending)
    pts = find_by_ps(punto_servicio_id).includes(:exam => :patient)
    logger.info "about to start case"
    logger.info "s is #{s}, and it's class is #{s.class}"
    case s
    when "pending"
      logger.info "status is pending"
      pts = pts.pending
    when "finished"
      logger.info "status is finished"
      pts = pts.finished
    else
      pts = pts.pending
    end
    logger.info "finished case"
    pts=pts.map{|e| e.exam.patient}.uniq
    pts.sort_by!(&:name)
  end

  def self.exams_by_punto_servicio_and_rut(punto_servicio_id, rut)
    find_by_ps(punto_servicio_id).includes(:exam => :patient).where(:patients => {:rut => rut})
    # para obtener lista 
    # r.map {|e| [e.id, e.exam.prestacion.descripcion, e.prestacion.punto_servicio.descripcion, e.exam.patient.name]}
  end

end
