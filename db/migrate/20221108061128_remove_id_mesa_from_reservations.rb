class RemoveIdMesaFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :id_mesa, :integer
  end
end
