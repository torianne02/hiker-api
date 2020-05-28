class AddUserIdToUserHikes < ActiveRecord::Migration[5.2]
  def change
    add_column :user_hikes, :user_id, :integer
  end
end
