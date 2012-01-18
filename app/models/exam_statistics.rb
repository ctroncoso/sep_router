class ExamStatistics

  # Tabla relacional básica
  # contiene la totalidad de pacientes y examenes del dia de hoy
  # Exam->patients
  def self.examenes
    timerange = (Time.now.midnight)..Time.now
    Exam.joins(:patient).includes(:prestacion => :punto_servicio).where(:patients =>{:started_at =>timerange})
  end

  # Obtiene el universo de prestaciones realizadas el día de hoy.
  def self.prestaciones
    conjunto = self.examenes.map{|r|[r.prestacion_id, r.exam_name.strip]}.uniq
    conjunto.map! do |prestacion|
      cantidad = self.pacientes(prestacion[0]).count
      prestacion << cantidad
    end
   end

  # Obtiene lista de pacientes de hoy, para una prestación dada.
  # FIXME: Debe basarse en modelo de paciente y no de exámen.
  def self.pacientes(prestacion)
    self.examenes.where(:exams => {:prestacion_id => prestacion})
  end

  # TODO: Verificar si se ejecuta
  # Log deja registro 
  # Verificar log por si se ejecuta el código.
  def self.compilado
    Rails.logger.info "****WARNING****   Ejecutando -ExamStatistics.compilado-"
    compilado = Hash.new
    self.prestaciones.each do |prestacion|
      id=prestacion[0]
      descrip = prestacion[1]
      compilado[id]=Hash.new
      compilado[id][:nombre]=descrip
      compilado[id][:pacientes]=self.examenes.where(:exams=>{:prestacion_id => id})
    end
    compilado
  end
end
