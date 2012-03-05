class ExamsController < ApplicationController
  def index
    if params[:patient_id] 
      @exams = Patient.find(params[:patient_id]).exams.order(:exam_name)
    else
      @exams = ExamStatistics.examenes_hoy
    end
    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @exams }
      format.xml { render xml: @exams }
    end
  end

  def show
    @exam = Patient.find(params[:patient_id]).exams
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam }
    end
  end

  def new
    @exam = Exam.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam }
    end
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def create
    @exam = Exam.new(params[:exam])
    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
        format.json { render json: @exam, status: :created, location: @exam }
      else
        format.html { render action: "new" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @exam = Exam.find(params[:id])
    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url }
      format.json { head :ok }
    end
  end
end
