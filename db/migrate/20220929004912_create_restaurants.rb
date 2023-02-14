class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.time :open
      t.time :close
      t.float :score
      t.string :food

      t.timestamps
    end
  end
end
