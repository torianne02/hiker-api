require 'rails_helper'

RSpec.describe Api::V1::ParksController do 
  # initialize test data
  let!(:park) { create(:park) }
  let(:park_id) { park.id }
  let!(:user) { create(:user) } 
  let(:headers) { valid_headers }

  # test suite for park creation
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

end 