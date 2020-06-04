require 'rails_helper'

RSpec.describe Api::V1::HikesController do 
  # initialize test data
  let!(:park) { create(:park) }
  let!(:hikes) { create_list(:hike, 20, park_id: park.id) }
  let!(:user) { create(:user) }
  let(:park_id) { park.id }
  let(:hike_id) { hikes.first.id }
  let(:headers) { valid_headers } 

  # test suite for GET /parks/:park_id/hikes
  describe 'GET api/v1/parks/:park_id/hikes' do
    before { get "/api/v1/parks/#{park_id}/hikes", params: {}, headers: headers }
    
    context 'when park exists' do
      it 'returns status code 200' do 
        expect(response).to have_http_status(200)
      end 

      it 'returns all park hikes' do
        expect(json.size).to eq(20)
      end 
    end

    context 'when park does not exist' do
      let(:park_id) { 0 }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do 
        expect(response.body).to match(/Couldn't find Park/)
      end 
    end 
  end
  
  # test suite for GET /parks/:park_id/hikes/:id
  describe 'GET api/v1/parks/:park_id/hikes/:id' do
    before { get "/api/v1/parks/#{park_id}/hikes/#{hike_id}", params: {}, headers: headers }
    
    context 'when park hike exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end 

      it 'returns the hike' do 
        expect(json['id']).to eq(hike_id)
      end
    end  

    context 'when park hike does not exist' do 
      let(:hike_id) { 0 }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do 
        expect(response.body).to match(/Couldn't find Hike/)
      end 
    end 
  end 

  # test suite for POST /parks/:park_id/hikes 
  describe 'POST api/v1/parks/:park_id/hikes' do 
    let(:valid_attributes) do
       { name: 'Seven Springs Trail', park_id: park_id }.to_json 
    end   

    context 'when request attributes are valid' do
      before { post "/api/v1/parks/#{park_id}/hikes", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end 
    end 

    context 'when an invalid request' do
      let(:invalid_attributes) { { name: nil}.to_json }
      before { post "/api/v1/parks/#{park_id}/hikes", params: invalid_attributes, headers: headers }

      it 'returns status code 422' do 
        expect(response).to have_http_status(422)
      end 

      it 'returns a failure message' do 
        expect(json['message']).to match(/Validation failed: Name can't be blank/)
      end 
    end 
  end 

  # test suite for PUT /parks/:park_id/hikes/:id
  describe 'PUT api/v1/parks/:park_id/hikes/:id' do 
    let(:valid_attributes) { { name: 'Lost Cost Trail' }.to_json }
    
    before { put "/api/v1/parks/#{park_id}/hikes/#{hike_id}", params: valid_attributes, headers: headers }

    context 'when hike exists' do 
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end 

      it 'updates the hike' do
        updated_hike = Hike.find(hike_id)
        expect(updated_hike.name).to match(/Lost Cost Trail/)
      end 
    end 

    context 'when the hike does not exist' do
      let(:hike_id) { 0 }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do 
        expect(response.body).to match(/Couldn't find Hike/)
      end 
    end 
  end 

  # test suite for DELETE /parks/:park_id/hikes/:id
  describe 'DELETE api/v1/parks/:park_id/hikes/:id' do
    before { delete "/api/v1/parks/#{park_id}/hikes/#{hike_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end 
  end
end 