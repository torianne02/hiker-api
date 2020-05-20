require 'date'

class User < ActiveRecord::Base
  has_secure_password
  has_many :user_hikes
  has_many :hikes, through: :user_hikes # again, TBD if this is the relationship I want

  validates :name, :username, :birthday, :gender, :password, presence: true 
  validates :username, uniqueness: true

  def age 
    ((Time.now - birthday.to_time)/(60*60*24*365)).floor
  end 
end 