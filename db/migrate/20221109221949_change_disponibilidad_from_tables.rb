class ChangeDisponibilidadFromTables < ActiveRecord::Migration[6.0]
  def change
    remove_column :tables, :disponibilidad
    add_column :tables, :disponibilidad, :boolean
    remove_column :tables, :fumador
    add_column :tables, :fumador, :boolean
  end
end
