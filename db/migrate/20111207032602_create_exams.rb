class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :patient_id
      t.integer :exam_id
      t.text :exam_name

      t.timestamps
    end
  end
end
