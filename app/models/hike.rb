class Hike < ActiveRecord::Base
  has_many :user_hikes
  has_many :users, through: :user_hikes # TBD if this is the exact relationship I want
  belongs_to :park 

  validates :name, :presence => true 
end 