class Hike < ActiveRecord::Base
  belongs_to :user
  belongs_to :park 

  validates :name, :presence => true 
end 