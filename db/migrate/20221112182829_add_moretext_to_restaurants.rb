class AddMoretextToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :slogan, :string
    add_column :restaurants, :description, :text
  end
end
