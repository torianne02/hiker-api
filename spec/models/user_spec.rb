require 'rails_helper'

# test suite for User model
RSpec.describe User, type: :model do 
  # association test
  it { should have_many(:user_hikes) }

  # validation tests
  [:name, :username, :password, :birthday, :gender, :email].each do |attr|
    it { should validate_presence_of(attr) }
  end 

  it { should validate_uniqueness_of(:username) }
end 