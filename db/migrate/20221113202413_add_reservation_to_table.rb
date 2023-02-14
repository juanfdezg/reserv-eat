class AddReservationToTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :tables, :reservation, foreign_key: true
  end
end
