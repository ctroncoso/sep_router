class AddRutEmpresaToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :rut_empresa, :string
  end
end
