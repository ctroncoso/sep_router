class PrestacionesController < ApplicationController
  # GET /prestacions
  # GET /prestacions.json
  def index
    params[:sort] ||= "punto_servicio_id"
    params[:direction] ||= "asc"
    @prestacions = Prestacion.order(params[:sort] + " " + params[:direction])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prestacions }
    end
  end

  # GET /prestacions/1
  # GET /prestacions/1.json
  def show
    @prestacion = Prestacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prestacion }
    end
  end

  # GET /prestacions/new
  # GET /prestacions/new.json
  def new
    @prestacion = Prestacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prestacion }
    end
  end

  # GET /prestacions/1/edit
  def edit
    @prestacion = Prestacion.find(params[:id])
  end

  # POST /prestacions
  # POST /prestacions.json
  def create
    @prestacion = Prestacion.new(params[:prestacion])

    respond_to do |format|
      if @prestacion.save
        format.html { redirect_to @prestacion, notice: 'Prestacion was successfully created.' }
        format.json { render json: @prestacion, status: :created, location: @prestacion }
      else
        format.html { render action: "new" }
        format.json { render json: @prestacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prestacions/1
  # PUT /prestacions/1.json
  def update
    @prestacion = Prestacion.find(params[:id])

    respond_to do |format|
      if @prestacion.update_attributes(params[:prestacion])
        format.html { redirect_to prestaciones_path, notice: 'Prestacion was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @prestacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestacions/1
  # DELETE /prestacions/1.json
  def destroy
    @prestacion = Prestacion.find(params[:id])
    @prestacion.destroy

    respond_to do |format|
      format.html { redirect_to prestacions_url }
      format.json { head :ok }
    end
  end

  def agrega_nuevas_prestaciones
     p=Exam.includes(:prestacion).where('prestaciones.id' => nil)
     n=p.map do |e|
       { :cod_prestacion => e.prestacion_id, 
         :descripcion    => e.exam_name
       }
     end.uniq
     n.each do |new|
       Prestacion.create(new)
     end
     redirect_to request.referer
  end
end
