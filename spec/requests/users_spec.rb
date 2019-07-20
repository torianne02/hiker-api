require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # initialize test data for sign-up/sign-in
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:user_valid_attr) do 
    attributes_for(:user)
  end 

  # test suite for user sign-uo
  describe 'POST /signup' do
    context 'when valid request' do 
      before { post '/signup', params: user_valid_attr.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end 

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end 

      it 'returns an authentication token' do 
        expect(json['auth_token']).not_to be_nil
      end 
    end 

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do 
        expect(response).to have_http_status(422)
      end 

      it 'returns failure message' do
        expect(json['message']).to match(/Validation failed: Password can't be blank, Name can't be blank, Username can't be blank, Age can't be blank, Gender can't be blank/)
      end 
    end 
  end 

  # ------------- DEAD CODE (FOR NOW) -------------
  # will add user show and update functionality later - - maybe also index but unsure

  # initialize test data for user data
  # let!(:users) { create_list(:user, 10) }
  # let(:user_id) { users.first.id }
  # let(:headers) { valid_headers }

  # # test suite for GET /users
  # describe 'GET /users' do
  #   # make HTTP request
  #   before { get '/users', params: {}, headers: headers }

  #   it 'returns users' do
  #     expect(json).not_to be_empty
  #     expect(json.size).to eq(10)
  #   end 

  #   it 'returns status code 200' do
  #     expect(response).to have_http_status(200)
  #   end 
  # end 

  # test suite for GET /users/:id
  describe 'GET /users/:id' do
    let(:user_id) { user.id }
    let(:headers) { valid_headers }
    
    # make HTTP request
    before { get "/users/#{user_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user_id)
      end 

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
        # erroring with "Invalid token couldn't find User without an ID"
      end
    end 

    context 'when the record does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 422' do 
        expect(response).to have_http_status(422)
      end 

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end 
  end 

  # # test suite for POST /users
  # describe 'POST /users' do
  #   # valid payload 
  #   let(:valid_attributes) { { name: 'Jessica Day', username: 'JAD', password: 'ab56q5u8', age: '26', gender: 'female' } }

  #   context 'when the request is valid' do
  #     before { post '/users', params: valid_attributes }

  #     it 'creates a user' do 
  #       expect(json['name']).to eq('Jessica Day')
  #     end

  #     it 'returns status code 200' do
  #       expect(response).to have_http_status(200)
  #     end
  #   end

  #   context 'when the request is invalid' do 
  #     before {post '/users', params: { name: 'Nick Miller' } }

  #     it 'returns status code 422' do 
  #       expect(response).to have_http_status(422)
  #     end 

  #     it 'returns a validation failure message' do
  #       expect(response.body).to match(/Validation failed: Password can't be blank, Username can't be blank, Age can't be blank, Gender can't be blank/)
  #     end
  #   end
  # end

  # # test suite for PUT /users/:id
  # describe 'PUT /users/:id' do
  #   let(:valid_attributes) { { name: 'Nick Miller' }.to_json }

  #   context 'when the record exists' do
  #     before { put "/users/#{user_id}", params: valid_attributes, params: valid_attributes, headers: headers }

  #     it 'updates the record' do 
  #       expect(response.body).to be_empty 
  #     end

  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end
  #   end
  # end 

  # # test suite for DELETE /users/:id
  # describe 'DELETE /users/:id' do
  #   before { delete "/users/#{user_id}", params: {}, headers: headers }

  #   it 'returns status code 204' do
  #     expect(response).to have_http_status(204)
  #   end 
  # end
end 

# RSpec.describe 'Users API', type: :request do
#   # initialize test data for user data
#   let!(:users) { create_list(:user, 10) }
#   let(:user_id) { users.first.id }
#   let(:headers) { valid_headers }

#   # test suite for GET /users
#   describe 'GET /users' do
#     # make HTTP request
#     before { get '/users', params: {}, headers: headers }

#     it 'returns users' do
#       expect(json).not_to be_empty
#       expect(json.size).to eq(10)
#     end 

#     it 'returns status code 200' do
#       expect(response).to have_http_status(200)
#     end 
#   end 
# end         