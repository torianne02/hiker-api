require 'rails_helper'

# Test suite for the Hike model
RSpec.describe Hike, type: :model do
    # association test
    it { should belong_to(:user) }

    # Validation test
    it { should validate_presence_of(:name, :location, :distance, :elevation_gain, :date_completed) }
end 