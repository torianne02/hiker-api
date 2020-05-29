class RemoveTypeFromParks < ActiveRecord::Migration[5.2]
  def change
    remove_column :parks, :type, :string
  end
end
