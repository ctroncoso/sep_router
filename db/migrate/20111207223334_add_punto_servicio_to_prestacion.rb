class AddPuntoServicioToPrestacion < ActiveRecord::Migration
  def change
    add_column :prestacions, :prestacion_id, :integer
  end
end
