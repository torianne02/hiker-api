class AddHikeIdToUserHikes < ActiveRecord::Migration[5.2]
  def change
    add_column :user_hikes, :hike_id, :integer
  end
end
