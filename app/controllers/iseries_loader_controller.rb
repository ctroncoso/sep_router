class IseriesLoaderController < ApplicationController
  before_filter :carga
  
  def new
  end

  def create
    # get new bulk
    # extract new patients.
    # for each patient, assign exams
  end

  def render_full
    out = []
    _pacientes.each do |pax|
      out << pax
      out << _examenes(pax)
    end

    render :text => out.to_yaml

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @patient }
    # end
  end

  def render_pacientes
    render :text => _pacientes.to_yaml
  end

  def render_examenes
    render :text => _examenes.to_yaml
  end

  def render_full_n
    render :text => IngresosSepHts.ultimos_n(200).to_yaml
  end

  private

  def _registros
    if @carga
      @carga.map do |record| 
        { nombre_completo: record.nombre_completo, 
          rut:  record.rut,
          ingreso: record.INGRES647A,
          prestacion: record.prestacion.strip , 
          cod_prestacion: record.cod_prestacion,
          hora_ingreso:  record.HORING647A,
          fecha_ingreso: record.FECING647A
        }
      end
    else
      []
    end
  end

  def _pacientes
    _registros.map do |record|
      {  nombre_completo: record[:nombre_completo],
         rut:  record[:rut],
         ingreso: record[:ingreso],
         fecha_ingreso: record[:fecha_ingreso],
         hora_ingreso: record[:hora_ingreso].strftime("%X")
      }
    end.uniq
  end

  def _examenes(pax_hash=nil)
    if pax_hash
      records = IngresosSepHts.find_all_by_RUTPAC647A_and_FECING647A_and_HORING647A( pax_hash[:rut], pax_hash[:fecha_ingreso], pax_hash[:hora_ingreso] )
    else
      records = @carga
    end
    records.map { |r| [r.prestacion, r.cod_prestacion]}.uniq
  end
  def carga
    @carga = IngresosSepHts.ultima_carga
  end

end
