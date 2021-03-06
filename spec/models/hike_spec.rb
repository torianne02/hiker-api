require 'rails_helper'

# Test suite for the Hike model
RSpec.describe Hike, type: :model do
  # association test
  it { should have_many(:user_hikes) }
  it { should belong_to(:park) }

  # Validation test
  it { should validate_presence_of(:name) }
end 