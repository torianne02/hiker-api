class UserHike < ActiveRecord::Base
  belongs_to :user
  belongs_to :hike

  validates :distance, :elevation_gain, :total_time, :date_completed => true 
end 