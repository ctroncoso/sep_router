class ExamStatisticsController < ApplicationController
  def index
    # universo de pacientes pendientes y sus puntos de servicio.
    p=Patient.active.of_today.joins(:exams=>{:prestacion => :punto_servicio}) \
      .select("distinct punto_servicios.id as ps_id, patients.id")

    # puntos de servicios individuales que aparecen como pendientes
    pss=p.map(&:ps_id).uniq.sort
    set=p.to_a
    result = pss.map do |id|
      cantidad = set.count{|x| x.ps_id == id}
      {id: id, :count => cantidad}
    end.sort_by{|n| n[:count]}.reverse
    result.map! do |r|
      {
        ps: PuntoServicio.find(r[:id]),
        count: r[:count]
      }
    end

    @cola_de_espera = result

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
