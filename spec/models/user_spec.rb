require 'rails_helper'

# test suite for User model
RSpec.describe User, type: :model do 
    # association test
    it { should have_many(:hikes).dependent(:destroy) }

    # validation test
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:gender) }
end 