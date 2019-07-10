class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.string :name
      t.string :location
      t.float :distance
      t.date :date_completed
      t.integer :elevation_gain
      t.integer :user_id
    end
  end
end
