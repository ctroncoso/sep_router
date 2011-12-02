class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :rut
      t.integer :ingreso
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
