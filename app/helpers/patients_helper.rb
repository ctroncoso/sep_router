module PatientsHelper
  def link_to_patient_procedure(patient, filter)
    if filter == 'finalizado'
      link_to " deshacer ", edit_patient_url(patient, :procedure => :devolver_a_cola)
    else
      link_to " terminado ", edit_patient_url(patient, :procedure => :finalizar)
    end
  end

  def elapsed_time(patient, filter)
    if filter == 'finalizado'
      distance_of_time_in_words_to_now(patient.started_at+3.hours)
    else
      distance_of_time_in_words_to_now(patient.started_at, patient.finished_at)
    end
  end
end
