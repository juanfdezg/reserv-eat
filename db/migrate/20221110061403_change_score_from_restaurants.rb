class ChangeScoreFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    change_column :restaurants, :score, :integer
  end
end
