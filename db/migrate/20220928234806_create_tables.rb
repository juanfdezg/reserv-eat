class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.string :nombre_restaurant
      t.integer :capacidad
      t.string :ubicacion
      t.integer :disponibilidad
      t.string :fumador

      t.timestamps
    end
  end
end
