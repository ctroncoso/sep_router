module PatientsHelper
  def link_to_patients_procedures(patients, procedure, options={})
    case procedure 
    when :finaliza_todos_estos_pendientes
      options[:fecha] ||= Date.today
      link_to(" Marcar todos estos pendientes como terminados ", 
              edit_patient_url({:id => :of_date, :procedure => :finaliza_todos_estos_pendientes, fecha: options[:fecha] }), :confirm=>"Esta realmente seguro"
             )
    end
  end

  def link_to_patient_procedure(patient, filter)
    if filter == 'finalizado'
      link_to " deshacer ", edit_patient_url(patient, {
            :procedure => :devolver_a_cola, 
            :fecha=> params[:fecha],
            :direction => params[:direction],
            :sort => params[:sort]
            })
    else
      link_to " terminado ", edit_patient_url(patient, {
            :procedure => :finalizar, 
            :fecha => params[:fecha],
            :direction => params[:direction],
            :sort => params[:sort]
            }), 
              {:confirm => "Va a finalizar al paciente #{patient.name}. \nConfirme."}
    end
  end

  def elapsed_time(patient, filter)
    if filter != 'finalizado'
      distance_of_time_in_words_to_now(patient.started_at+3.hours)
    else
      (Time.now.midnight + ((patient.started_at - patient.finished_at).abs.round)).to_formatted_s(:time)
    end
  end

  def puntos_de_servicio(patient)
    patient.exams.map { |e| e.prestacion.punto_servicio.descripcion}.uniq
  end

  def date_swicher(date=nil)
    if date
      date = Date.parse(date)
    else
      date = Date.today
    end
    outstring = ""
    outstring << link_to("<= ", params.merge({:fecha => (date-1.day).to_s}))
    outstring << l(date, :format=> :long).titleize
    outstring << link_to(" =>", params.merge({:fecha => (date+1.day).to_s}))
    outstring.html_safe
  end
end
