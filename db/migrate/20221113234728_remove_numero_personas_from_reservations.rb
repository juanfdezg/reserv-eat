class RemoveNumeroPersonasFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :numero_personas
  end
end
