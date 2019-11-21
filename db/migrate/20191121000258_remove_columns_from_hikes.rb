class RemoveColumnsFromHikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :hikes, :distance, :float
    remove_column :hikes, :date_completed, :date
    remove_column :hikes, :elevation_gain, :integer
    remove_column :hikes, :user_id, :integer
  end
end
