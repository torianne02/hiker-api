class AddTotalTimeToUserHikes < ActiveRecord::Migration[5.2]
  def change
    add_column :user_hikes, :total_time, :integer
  end
end
