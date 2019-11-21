class Park < ActiveRecord::Base 
  has_many :hikes

  validates :name, :location, :park_type, :presence => true
end 