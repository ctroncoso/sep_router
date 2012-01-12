class CreateColas < ActiveRecord::Migration
  def change
    create_table :colas do |t|
      t.integer :prestacion_id
      t.integer :exam_id
      t.datetime :encolado_at
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
