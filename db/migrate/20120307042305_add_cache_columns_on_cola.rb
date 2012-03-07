class AddCacheColumnsOnCola < ActiveRecord::Migration
  def up
    add_column :colas, :patient_id,        :integer
    add_column :colas, :punto_servicio_id, :integer

    Cola.includes(:exam => :patient).includes(:exam => {:prestacion => :punto_servicio}).all.each do |c|
      c.patient_id = c.exam.patient.id
      c.punto_servicio_id = c.exam.prestacion.punto_servicio.id
      c.save!
    end
  end

  def down
    remove_column :colas, :patient_id
    remove_column :colas, :punto_servicio_id
  end
end
