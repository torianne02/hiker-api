require 'rails_helper'

# Test suite for the Hike model
RSpec.describe Park, type: :model do
  # association test
  it { should have_many(:hikes) }

  # Validation test
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:location) }
end 