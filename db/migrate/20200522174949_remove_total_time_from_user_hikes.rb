class RemoveTotalTimeFromUserHikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_hikes, :total_time, :time
  end
end
