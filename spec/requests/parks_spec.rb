require 'rails_helper'

RSpec.describe Api::V1::ParksController do 
  # initialize test data
  let!(:park) { create(:park) }
  let(:park_id) { park.id }
  let!(:user) { create(:user) } 
  let(:headers) { valid_headers }

  # test suite for POST /parks
  describe 'POST /park' do
    let(:valid_attributes) do 
      { name: 'Yosemite National Park', location: 'California', park_type: 'Federal'}.to_json
    end 

    context 'when request attributes are valid' do
      before { post "/api/v1/parks", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end 
    end 

    context 'when invalid request' do 
      let(:invalid_attributes) { { name: nil}.to_json }
      
      before { post "/api/v1/parks", params: invalid_attributes, headers: headers }

      it 'returns status code 422' do 
        expect(response).to have_http_status(422)
      end 

      it 'returns a failure message' do 
        expect(json['message']).to match(/Validation failed: Name can't be blank/)
      end 
    end
  end 

  # test suite for GET /parks
  describe 'GET api/v1/parks' do
    let!(:parks) { create_list(:park, 5) }
    let(:headers) { valid_headers }

    before { get "/api/v1/parks", params: {}, headers: headers}

    it 'returns parks' do 
      expect(json).not_to be_empty

      expect(json.size).to eq(6)
    end 

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end 

  # test suit for GET /parks/:park_id
  describe 'GET api/v1/parks/:park_id' do 
    before { get "/api/v1/parks/#{park_id}", params: {}, headers: headers }

    context 'when park exists' do 
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end 

      it 'returns the park' do
        expect(json['id']).to eq(park_id)
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

  # test suite for PUT /parks/:park_id
  describe 'PUT api/v1/parks/:park_id' do 
    let(:valid_attributes) { { name: 'Lassen Volcanic National Park' }.to_json }

    before { put "/api/v1/parks/#{park_id}", params: valid_attributes, headers: headers }

    context 'when park exists' do
      it 'returns status code 204' do 
        expect(response).to have_http_status(204)
      end 

      it 'updates the park' do
        updated_park = Park.find(park_id)
        expect(updated_park.name).to match(/Lassen Volcanic National Park/)
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

  # test suite for DELETE /parks/:park_id
  describe 'DELETE api/v1/parks/:park_id' do
    before { delete "/api/v1/parks/#{park_id}", params: {}, headers: headers}

    it 'returns status code 204' do 
      expect(response).to have_http_status(204)
    end 
  end 
end 