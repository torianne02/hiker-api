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

  # test suite for POST /users/:user_id/hikes 
  describe 'POST /users/:user_id/hikes' do 
    let(:valid_attributes) { { name: 'Seven Springs Trail', location: 'Fremont Older Open Space Preserve', distance: '3.1', elevation_gain: '614', date_completed: '06-11-2019' } }  

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/hikes", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end 
    end 

    context 'when an invalid request' do
      before { post "/users/#{user_id}/hikes", params: {} }

      it 'returns status code 422' do 
        expect(response).to have_http_status(422)
      end 

      it 'returns a failure message' do 
        expect(response.body).to match(/Validation failed: Name can't be blank, Location can't be blank, Distance can't be blank, Date completed can't be blank, Elevation gain can't be blank/)
      end 
    end 
  end 

  # test suite for PUT /users/:user_id/hikes/:id
  describe 'PUT /users/user_id/hikes/:id' do 
    let(:valid_attributes) { { distance: '3.0' } }
    
    before { put "/users/#{user_id}/hikes/#{id}", params: valid_attributes }

    context 'when hike exists' do 
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end 

      it 'updates the hike' do
        updated_hike = Hike.find(id)
        expect(updated_hike.distance).to match(/3.0/)
      end 
    end 

    context 'when the hike does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do 
        expect(response.body).to match(/Couldn't find Hike/)
      end 
    end 
  end 

    # test suite for DELETE /users/:user_id/hikes/:id
    describe 'DELETE /users/:user_id/hikes/:id' do
      before { delete "/users/#{user_id}/hikes/#{id}" }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end 
    end
end 