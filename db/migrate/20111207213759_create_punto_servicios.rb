class CreatePuntoServicios < ActiveRecord::Migration
  def change
    create_table :punto_servicios do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
