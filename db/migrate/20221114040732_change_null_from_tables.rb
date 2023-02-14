class ChangeNullFromTables < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tables, :reservation_id, true
  end
end
