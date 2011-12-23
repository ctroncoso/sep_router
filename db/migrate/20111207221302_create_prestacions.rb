class CreatePrestacions < ActiveRecord::Migration
  def change
    create_table :prestacions do |t|
      t.integer :cod_prestacion
      t.string :descripcion

      t.timestamps
    end
  end
end
