require 'rails_helper'

# test suite for User model
RSpec.describe User, type: :model do 
  # association test
  it { should have_many(:user_hikes) }

  # validation test
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:birthday) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:username) }
end 