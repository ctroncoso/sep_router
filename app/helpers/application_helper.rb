module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = params[:sort]==column && params[:direction] == "asc" ? "desc" : "asc"
    link_to title, params.merge({:sort => column, :direction => direction})
  end
end
