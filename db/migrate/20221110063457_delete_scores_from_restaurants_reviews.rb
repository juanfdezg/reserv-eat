class DeleteScoresFromRestaurantsReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :score
    add_column :restaurants, :rating, :integer
    remove_column :reviews, :rating
    add_column :reviews, :rating, :integer
  end
end
