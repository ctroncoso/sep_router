class ColasController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /colas
  # GET /colas.json
  def index
    params[:fecha] ||= Date.today.to_s
    
    queue = Struct.new(:punto_servicio, :pendientes, :finalizados)
    @colas = Array.new
    PuntoServicio.order(:descripcion).all.each do |ps|
      pendientes = Cola.of_date(params[:fecha]).patients_by_punto_servicio( ps, "pending" ).size
      finalizados = Cola.of_date(params[:fecha]).patients_by_punto_servicio( ps, "finished" ).size
      @colas << queue.new( ps, pendientes, finalizados )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colas }
    end
  end

  def pacientes
    params[:fecha] ||= Date.today.to_s

    @pacientes = Cola.of_date(params[:fecha]).patients_by_punto_servicio(params[:id], params[:condicion])
    if params[:sort]=="started_at" 
      @pacientes.sort_by!(&:started_at)
    else
      @pacientes.sort_by!(&:name)
    end

    respond_to do |format|
      format.html # pacientes.html.erb
      format.json { render json: @colas }
    end
  end
  
  def terminar
    @colas = Cola.exams_by_punto_servicio_and_patient_id(params[:ps], params[:id])

    @colas.each do |e|
      e.finished_at = Time.now
      e.save!
    end

    redirect_to request.referer
  end
end
