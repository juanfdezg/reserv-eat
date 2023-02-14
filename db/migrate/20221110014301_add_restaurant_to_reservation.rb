class AddRestaurantToReservation < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :restaurant, null: false, foreign_key: true
  end
end
