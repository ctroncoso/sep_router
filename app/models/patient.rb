class Patient < ActiveRecord::Base
  has_many :exams

  def self.hours_ago(hours=nil)
    if hours.nil?
      where(:started_at => (Time.now.midnight)..Time.now )
    else
      where(:started_at => ( Time.now - hours.to_i.hours)..Time.now )
    end
  end

  def self.of_today
    self.hours_ago
  end

  def self.active
    where('started_at is not null').where('finished_at is null')
  end

  def self.finished
    where('started_at is not null').where('finished_at is not null')
  end

  def self.of_date(fecha)
    date = Time.parse(fecha)
    where(:started_at => (date.midnight..(date.midnight+1.day)))
  end

  def self.time_wating_gt(elapsed)
        patients=active.where(:started_at => (Time.now.midnight..(Time.now-(elapsed.minutes+3.hours))))
        patients.select! do |p|
          prestaciones=p.exams.map do |e| 
            e.prestacion.punto_servicio.descripcion
          end.uniq.size
          (prestaciones <= 4)
        end
  end
end
