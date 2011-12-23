class PuntoServiciosController < ApplicationController
  # GET /punto_servicios
  # GET /punto_servicios.json
  def index
    @punto_servicios = PuntoServicio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @punto_servicios }
    end
  end

  # GET /punto_servicios/1
  # GET /punto_servicios/1.json
  def show
    @punto_servicio = PuntoServicio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @punto_servicio }
    end
  end

  # GET /punto_servicios/new
  # GET /punto_servicios/new.json
  def new
    @punto_servicio = PuntoServicio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @punto_servicio }
    end
  end

  # GET /punto_servicios/1/edit
  def edit
    @punto_servicio = PuntoServicio.find(params[:id])
  end

  # POST /punto_servicios
  # POST /punto_servicios.json
  def create
    @punto_servicio = PuntoServicio.new(params[:punto_servicio])

    respond_to do |format|
      if @punto_servicio.save
        format.html { redirect_to punto_servicios_path, notice: 'Punto servicio was successfully created.' }
        format.json { render json: @punto_servicio, status: :created, location: @punto_servicio }
      else
        format.html { render action: "new" }
        format.json { render json: @punto_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /punto_servicios/1
  # PUT /punto_servicios/1.json
  def update
    @punto_servicio = PuntoServicio.find(params[:id])

    respond_to do |format|
      if @punto_servicio.update_attributes(params[:punto_servicio])
        format.html { redirect_to @punto_servicio, notice: 'Punto servicio was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @punto_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /punto_servicios/1
  # DELETE /punto_servicios/1.json
  def destroy
    @punto_servicio = PuntoServicio.find(params[:id])
    @punto_servicio.destroy

    respond_to do |format|
      format.html { redirect_to punto_servicios_url }
      format.json { head :ok }
    end
  end
end
