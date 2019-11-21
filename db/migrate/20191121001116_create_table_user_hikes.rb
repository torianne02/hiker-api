class CreateTableUserHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :table_user_hikes do |t|
      t.float :distance
      t.date :date_completed
      t.integer :elevation_gain
      t.integer :user_id
      t.integer :hike_id
      t.integer :rating
      t.text :comment
      t.time :duration
    end
  end
end
