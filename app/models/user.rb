require 'date'

class User < ActiveRecord::Base
  has_secure_password
  has_many :hikes, dependent: :destroy

  validates :name, :username, :birthday, :gender, :password, :presence => true 
  validates :username, :uniqueness => true

  def age 
    ((Time.now - birthday.to_time)/(60*60*24*365)).floor
  end 
end 