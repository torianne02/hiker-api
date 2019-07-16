class Hike < ActiveRecord::Base
  belongs_to :user 

  validates :name, :location, :distance, :date_completed, :elevation_gain, :presence => true 
end 