class Park < ActiveRecord::Base
  has_many :hikes

  validates :name, :type, :location, presence: true 
end 