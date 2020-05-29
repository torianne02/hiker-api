require 'rails_helper'

# Test suite for the Hike model
RSpec.describe Park, type: :model do
  # association test
  it { should have_many(:hikes) }

  # Validation test
  [:name, :park_type, :location].each do |attr|
    it { should validate_presence_of(attr) }
  end
end 