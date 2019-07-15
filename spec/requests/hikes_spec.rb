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

    context 'when user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do 
        expect(response.body).to match(/Couldn't find User/)
      end 
    end 
  end
  
  # test suite for GET /users/:user_id/hikes/:id
  describe 'GET /users/:user_id/hikes/:id' do
    before { get "/users/#{user_id}/hikes/#{id}" }
    
    context 'when user hike exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end 

      it 'returns the hike' do 
        expect(json['id']).to eq(id)
      end
    end  

    context 'when user hike does not exist' do 
      let(:id) { 0 }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do 
        expect(response.body).to match(/Couldn't find Hike/)
      end 
    end 
  end 

end 