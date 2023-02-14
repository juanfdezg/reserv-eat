class AddDayToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :fecha_reserva, :date
  end
end
