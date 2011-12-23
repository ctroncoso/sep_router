class CreateAsocPuntoServicios < ActiveRecord::Migration
  def change
    create_table :asoc_punto_servicios do |t|
      t.integer :examen_id
      t.integer :punto_servicio_id

      t.timestamps
    end
  end
end
