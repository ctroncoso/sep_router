class RenamePuntoservicioPrestacionesId < ActiveRecord::Migration
  def up
    rename_column(:prestacions, :prestacion_id, :punto_servicio_id)
  end

  def down
    rename_column(:prestacions, :punto_servicio_id, :prestacion_id)
  end
end
