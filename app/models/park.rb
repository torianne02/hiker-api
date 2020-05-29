class Park < ActiveRecord::Base
  has_many :hikes

  validates :name, :park_type, :location, presence: true 
end 