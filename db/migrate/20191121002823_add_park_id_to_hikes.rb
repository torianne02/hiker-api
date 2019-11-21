class AddParkIdToHikes < ActiveRecord::Migration[5.2]
  def change
    add_column :hikes, :park_id, :integer
  end
end
