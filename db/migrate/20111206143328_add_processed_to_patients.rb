class AddProcessedToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :processed, :boolean
  end
end
