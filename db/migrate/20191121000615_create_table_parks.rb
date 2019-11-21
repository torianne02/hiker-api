class CreateTableParks < ActiveRecord::Migration[5.2]
  def change
    create_table :table_parks do |t|
      t.string :name
      t.string :type
      t.string :location
    end
  end
end
