class User < ActiveRecord::Base
    has_secure_password
    has_many :hikes, dependent: :destroy

    validates :name, :username, :age, :gender, :password, :presence => true 

    validates :username, :uniqueness => true
end 