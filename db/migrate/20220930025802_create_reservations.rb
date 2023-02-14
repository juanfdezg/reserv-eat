class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :nombre_usuario
      t.integer :id_mesa
      t.time :hora_inicio
      t.time :hora_termino

      t.timestamps
    end
  end
end
