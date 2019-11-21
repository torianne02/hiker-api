class UserHike < ActiveRecord::Base
  belongs_to :user 
  belongs_to :hike

  validates :user_id, :hike_id, :distance, :date_completed, :elevation_gain, presence: true
end 