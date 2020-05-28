# require 'rails_helper'

# RSpec.describe Api::V1::HikesController do 
#   # initialize test data
#   let!(:user) { create(:user) }
#   let!(:hikes) { create_list(:hike, 20, user_id: user.id) }
#   let(:user_id) { user.id }
#   let(:id) { hikes.first.id }
#   let(:headers) { valid_headers } 

#   # test suite for GET /users/:user_id/hikes
#   describe 'GET api/v1/users/:user_id/hikes' do
#     before { get "/api/v1/users/#{user_id}/hikes", params: {}, headers: headers }
    
#     context 'when user exists' do
#       it 'returns status code 200' do 
#         expect(response).to have_http_status(200)
#       end 

#       it 'returns all user hikes' do
#         expect(json.size).to eq(20)
#       end 
#     end

#     context 'when user does not exist' do
#       let(:user_id) { 0 }

#       it 'returns status code 404' do 
#         expect(response).to have_http_status(404)
#       end 

#       it 'returns a not found message' do 
#         expect(response.body).to match(/Couldn't find User/)
#       end 
#     end 
#   end
  
#   # test suite for GET /users/:user_id/hikes/:id
#   describe 'GET api/v1/users/:user_id/hikes/:id' do
#     before { get "/api/v1/users/#{user_id}/hikes/#{id}", params: {}, headers: headers }
    
#     context 'when user hike exists' do
#       it 'returns status code 200' do
#         expect(response).to have_http_status(200)
#       end 

#       it 'returns the hike' do 
#         expect(json['id']).to eq(id)
#       end
#     end  

#     context 'when user hike does not exist' do 
#       let(:id) { 0 }

#       it 'returns status code 404' do 
#         expect(response).to have_http_status(404)
#       end 

#       it 'returns a not found message' do 
#         expect(response.body).to match(/Couldn't find Hike/)
#       end 
#     end 
#   end 

#   # test suite for POST /users/:user_id/hikes 
#   describe 'POST api/v1/users/:user_id/hikes' do 
#     let(:valid_attributes) do
#        { name: 'Seven Springs Trail', location: 'Fremont Older Open Space Preserve', distance: '3.1', elevation_gain: '614', date_completed: '06-11-2019' }.to_json 
#     end   

#     context 'when request attributes are valid' do
#       before { post "/api/v1/users/#{user_id}/hikes", params: valid_attributes, headers: headers }

#       it 'returns status code 201' do
#         expect(response).to have_http_status(201)
#       end 
#     end 

#     context 'when an invalid request' do
#       let(:invalid_attributes) { { name: nil}.to_json }
#       before { post "/api/v1/users/#{user_id}/hikes", params: invalid_attributes, headers: headers }

#       it 'returns status code 422' do 
#         expect(response).to have_http_status(422)
#       end 

#       it 'returns a failure message' do 
#         expect(json['message']).to match(/Validation failed: Name can't be blank, Location can't be blank, Distance can't be blank, Date completed can't be blank, Elevation gain can't be blank/)
#       end 
#     end 
#   end 

#   # test suite for PUT /users/:user_id/hikes/:id
#   describe 'PUT api/v1/users/user_id/hikes/:id' do 
#     let(:valid_attributes) { { distance: '3.0' }.to_json }
    
#     before { put "/api/v1/users/#{user_id}/hikes/#{id}", params: valid_attributes, headers: headers }

#     context 'when hike exists' do 
#       it 'returns status code 204' do
#         expect(response).to have_http_status(204)
#       end 

#       it 'updates the hike' do
#         updated_hike = Hike.find(id)
#         expect(updated_hike.distance).to eq(3.0)
#       end 
#     end 

#     context 'when the hike does not exist' do
#       let(:id) { 0 }

#       it 'returns status code 404' do 
#         expect(response).to have_http_status(404)
#       end 

#       it 'returns a not found message' do 
#         expect(response.body).to match(/Couldn't find Hike/)
#       end 
#     end 
#   end 

#     # test suite for DELETE /users/:user_id/hikes/:id
#     describe 'DELETE api/v1/users/:user_id/hikes/:id' do
#       before { delete "/api/v1/users/#{user_id}/hikes/#{id}", params: {}, headers: headers }

#       it 'returns status code 204' do
#         expect(response).to have_http_status(204)
#       end 
#     end
# end 