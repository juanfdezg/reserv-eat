class AddCommuneToRestaurants < ActiveRecord::Migration[6.0]
  def change
    rename_column :restaurants, :location, :address
    add_column :restaurants, :commune, :string
  end
end
