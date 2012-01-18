class ExamStatisticsController < ApplicationController
  def index
    @puntos_servicios = Patient.active.of_today.joins(:exams=>{:prestacion => :punto_servicio}).select("punto_servicios.id, punto_servicios.descripcion, count(*) as cantidad").group('descripcion').order("cantidad desc")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exams }
      format.xml { render xml: @exams }
      format.yaml { render yaml: @exams }
    end
  end

  def pacientes
    @prestacion = params[:prestacion]
    @pacientes = ExamStatistics.pacientes(@prestacion).map(&:patient).sort do |p1,p2|
      p1.name <=> p2.name
    end
      
  end
end
