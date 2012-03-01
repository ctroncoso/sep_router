class IseriesLoaderController < ApplicationController
  before_filter :carga, :except => [:render_full_n]
  
  def new
  end

  def my_session
    render :text => request.session_options[:id]
  end

  def load 
    # get new bulk
    pacientes.each do |pac|
      if paciente_nuevo?(pac)
        p=Patient.new(pac)
        p.save!
        IngresosSepHts.examenes(pac).each do |exm|
          e= p.exams.create(exm)
          Cola.create {:exam_id => e.id, :prestacion_id => e.prestacion.id}
        end
      end
    end
    render :text => "done"
  end

  def render_full
    out = []
    pacientes.each do |pax|
      out << pax
      out << IngresosSepHts.examenes(pax)
    end
    render :text => out.to_yaml
  end

  def render_pacientes
    render :text => pacientes.to_yaml
  end

  def render_examenes
    if params[:rut]
      render :text => params[:rut]
    else
      render :text => IngresosSepHts.examenes.to_yaml
    end
  end

  def render_full_n
    data = IngresosSepHts.ultimos_n(1000).to_yaml
    render :text => data
  end

  private

  # devuelve hash de datos de la carga mas reciente
  def paciente_nuevo?(pax)
    Patient.find_by_name_and_rut_and_ingreso(pax[:name], pax[:rut], pax[:ingreso]) ? false : true
  end


  # resumen de datos de pacientes únicos obtenido de _regsitros 
  def pacientes
    _registros.map do |record|
      {  name: record[:name],
         rut:  record[:rut],
         ingreso: record[:ingreso],
         started_at: record[:started_at],
         rut_empresa: record[:rut_empresa]
      }
    end.uniq
  end

  def _registros
    if @carga
      @carga.map do |record| 
        { name: record.nombre_completo, 
          rut:  record.rut,
          ingreso: record.INGRES647A,
          rut_empresa: record.RUTEMP647A,
          prestacion: record.prestacion.strip , 
          cod_prestacion: record.cod_prestacion.to_s,
          started_at: record.ingreso
        }
      end
    else
      {}
    end
  end

  # load de la última carga realizada por iseries.
  def carga
    @carga = IngresosSepHts.ultima_carga
  end

end
