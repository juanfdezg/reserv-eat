class AddNumberPeopleToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :numero_personas, :integer
  end
end
