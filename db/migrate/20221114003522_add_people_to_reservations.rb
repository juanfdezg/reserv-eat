class AddPeopleToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :people, :int
  end
end
