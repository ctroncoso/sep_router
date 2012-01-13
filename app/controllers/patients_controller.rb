class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.includes([:exams])
    case params[:filter]
    when 'finalizado'
      @patients = @patients.finished
    else
      @patients = @patients.active
    end
    params[:sort] ||= "started_at"
    params[:direction] ||= "desc"

    if params[:hace_horas]
      @patients = @patients.hours_ago(params[:hace_horas])
    else
      @patients = @patients.of_today
    end


    #TODO implement reverse order
    if params[:sort] =="examenes"
      @patients.sort! do |a,b|
        a.exams.size <=> b.exams.size
      end
    else
      @patients = @patients.order(params[:sort])
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
    @patient = Patient.find(params[:id])
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


  def service_end
    @patient = Patient.find(params[:id])
    @patient.finished_at = Time.now - 3.hours
    @patient.save!
    
    respond_to do |format|
      format.html { redirect_to patients_url}
      format.json { head :ok }
    end
  end
end
