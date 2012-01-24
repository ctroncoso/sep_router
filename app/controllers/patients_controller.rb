class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json
  def index
    params[:sort] ||= "started_at"
    params[:direction] ||= "desc"
    params[:fecha] ||= Date.today.to_s

    @patients = Patient.includes(:exams=> :prestacion)
    case params[:filter]
    when 'finalizado'
      @patients = @patients.finished
      @patients = @patients.of_date(params[:fecha])
    when 'queue_warning_180'
      #TODO: inject sorting to some method like "sorted_patients"
      @patients = Patient.time_wating_gt(180) || []
      @unsortable = true
    else
      @patients = @patients.active
      @patients = @patients.of_date(params[:fecha])
    end


    case params[:sort]
    when "examenes"
      @patients.sort! do |a,b|
        a.exams.map{ |e| e.prestacion.punto_servicio.descripcion}.uniq.size <=> b.exams.map{ |e| e.prestacion.punto_servicio.descripcion}.uniq.size
      end
    when "elapsed"
      @patients.sort! do |a,b|
        a_finished_at = a.finished_at || Time.now
        b_finished_at = b.finished_at || Time.now
        (a_finished_at - a.started_at) <=> (b_finished_at - b.started_at)
      end
    else
      @patients = @patients.order(params[:sort]) unless @unsortable
    end

    if params[:direction] == "desc"
      @patients.reverse!
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
      format.xml { render xml: @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    case params[:procedure]
    when "finalizar"
      finalizar()
    when "devolver_a_cola"
      nullify_finished_at
    when 'finaliza_todos_estos_pendientes'
      finalize_queued_patients(params[:fecha])
    else
      @patient = Patient.find(params[:id])
    end
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :ok }
    end
  end

private

  def finalizar
    @patient = Patient.find(params[:id])
    @patient.finished_at = Time.now - 3.hours
    @patient.save!
    
    respond_to do |format|
      format.html { redirect_to patients_url({
            :fecha=> params[:fecha],
            :direction => params[:direction],
            :sort => params[:sort]
            })}
      format.json { head :ok }
    end
  end

  def nullify_finished_at
    @patient = Patient.find(params[:id])
    @patient.finished_at = nil
    @patient.save!
    respond_to do |format|
      format.html { redirect_to patients_url({filter: params[:filter], fecha: params[:fecha]}) }
      format.json { head :ok }
    end
  end

  def finalize_queued_patients(date)
    mydate=Date.parse(date)
    mydate_midnight=mydate.midnight
    mydate_next_midnight = mydate_midnight + 1.day
    Patient.active.of_date(date).each do |p|
      p.finished_at = mydate_next_midnight
      p.save!
    end
    respond_to do |format|
      format.html { redirect_to patients_url(fecha: date)}
      format.json { head :ok }
    end

  end

end
