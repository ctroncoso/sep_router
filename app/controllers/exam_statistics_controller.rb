class ExamStatisticsController < ApplicationController
  def index
    @exams = ExamStatistics.prestaciones
    @exams.sort! do |a,b|
      a[2] <=> b[2]
    end.reverse!

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
