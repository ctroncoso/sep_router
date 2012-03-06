class ColasController < ApplicationController
  # GET /colas
  # GET /colas.json
  def index
    params[:fecha] ||= Date.today.to_s
    
    pendientes = params[:pend]=="true" 

    queue = Struct.new(:punto_servicio, :cantidad)
    @colas = Array.new
    PuntoServicio.order(:descripcion).all.each do |ps|
      cantidad = Cola.of_date(params[:fecha]).patients_by_punto_servicio( ps, pendientes ).size
      @colas << queue.new( ps, cantidad )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colas }
    end
  end

  def pacientes
    params[:fecha] ||= Date.today.to_s

    @pacientes = Cola.of_date(params[:fecha]).patients_by_punto_servicio(params[:id])

    respond_to do |format|
      format.html # pacientes.html.erb
      format.json { render json: @colas }
    end
  end
  
  def terminar
    @colas = Cola.exams_by_punto_servicio_and_rut(params[:ps], params[:rut])

    @colas.each do |e|
      e.finished_at = Time.now
      e.save!
    end

    redirect_to request.referer
  end
end
