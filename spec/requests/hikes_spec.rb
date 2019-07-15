require 'rails_helper'

RSpec.describe 'Hikes API' do 
  # initialize test data
  let!(:user) { create(:user) }
  let!(:hikes) { create_list(:hike, 20, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { hikes.first.id }

  # test suite for GET /users/:user_id/hikes
  describe 'GET /users/:user_id/hikes' do
    before { get "/users/#{user_id}/hikes" }
    
    context 'when user exists' do
      it 'returns status code 200' do 
        expect(response).to have_http_status(200)
      end 

      it 'returns all user hikes' do
        expect(json.size).to eq(20)
      end 
    end
end 