class Hike < ActiveRecord::Base
  belongs_to :park
  has_many :user_hikes
  has_many :hikes, through: :user_hikes

  validates :name, :presence => true 
end 