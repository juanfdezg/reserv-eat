class AddImageUrlToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :logo, :string
  end
end
