require 'rails_helper'

# test suite for User model
RSpec.describe UserHike, type: :model do 
  # association test
  it { should belong_to(:user) }
  it { should belong_to(:hike) }

  # validation test
  it { should validate_presence_of(:distance) }
  it { should validate_presence_of(:elevation_gain) }
  it { should validate_presence_of(:total_time) }
  it { should validate_presence_of(:date_completed) }
end 