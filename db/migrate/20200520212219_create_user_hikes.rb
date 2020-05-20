class CreateUserHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_hikes do |t|
      t.float :distance
      t.date :date_completed
      t.integer :elevation_gain
      t.time :total_time
      t.integer :rating
      t.text :comment
    end
  end
end
