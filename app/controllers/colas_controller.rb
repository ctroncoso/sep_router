class ColasController < ApplicationController
  # GET /colas
  # GET /colas.json
  def index
    queue = Struct.new(:punto_servicio, :cantidad)
    @colas = Array.new
    PuntoServicio.all.each do |ps|
      cantidad = Cola.of_today.patients_by_punto_servicio(ps).size
      @colas << queue.new( ps, cantidad )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colas }
    end
  end

  # GET /colas/1
  # GET /colas/1.json
  def show
    @cola = Cola.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cola }
    end
  end

  # GET /colas/new
  # GET /colas/new.json
  def new
    @cola = Cola.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cola }
    end
  end

  # GET /colas/1/edit
  def edit
    @cola = Cola.find(params[:id])
  end

  # POST /colas
  # POST /colas.json
  def create
    @cola = Cola.new(params[:cola])

    respond_to do |format|
      if @cola.save
        format.html { redirect_to @cola, notice: 'Cola was successfully created.' }
        format.json { render json: @cola, status: :created, location: @cola }
      else
        format.html { render action: "new" }
        format.json { render json: @cola.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /colas/1
  # PUT /colas/1.json
  def update
    @cola = Cola.find(params[:id])

    respond_to do |format|
      if @cola.update_attributes(params[:cola])
        format.html { redirect_to @cola, notice: 'Cola was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cola.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colas/1
  # DELETE /colas/1.json
  def destroy
    @cola = Cola.find(params[:id])
    @cola.destroy

    respond_to do |format|
      format.html { redirect_to colas_url }
      format.json { head :ok }
    end
  end
end
