require 'rails_helper'

# test suite for User model
RSpec.describe UserHike, type: :model do 
  # association test
  it { should belong_to(:user) }
  it { should belong_to(:hike) }

  # validation test
  [:distance, :elevation_gain, :total_time, :date_completed].each do |attr|
    it { should validate_presence_of(attr) }
  end
end 