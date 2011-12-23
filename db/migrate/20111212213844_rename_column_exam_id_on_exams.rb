class RenameColumnExamIdOnExams < ActiveRecord::Migration
  def up
    rename_column(:exams, :exam_id, :prestacion_id )
  end

  def down
    rename_columm(:exams, :prestacion_id, :exam_id)
  end
end
