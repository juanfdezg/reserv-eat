class AddDetailsToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :ubicacion, :string
    add_column :reservations, :fumador, :boolean
  end
end
