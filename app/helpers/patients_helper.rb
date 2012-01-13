module PatientsHelper
  def link_to_patient_procedure(patient, filter)
    if filter == 'finalizado'
      link_to " deshacer ", edit_patient_url(patient, :procedure => :devolver_a_cola)
    else
      link_to " terminado ", edit_patient_url(patient, :procedure => :finalizar)
    end
  end
end
