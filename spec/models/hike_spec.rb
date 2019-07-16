require 'rails_helper'

# Test suite for the Hike model
RSpec.describe Hike, type: :model do
  # association test
  it { should belong_to(:user) }

  # Validation test
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:distance) }
  it { should validate_presence_of(:elevation_gain) }
  it { should validate_presence_of(:date_completed) }
end 