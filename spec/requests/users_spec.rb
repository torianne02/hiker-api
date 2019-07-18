require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # initialize test data for user data
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  # initialize test data for sign-up/sign-in
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:user_valid_attr) do 
    attributes_for(:user, password_confirmation: user.password)
  end 

  # test suite for GET /users
  describe 'GET /users' do
    # make HTTP request
    before { get '/users' }

    it 'returns users' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end 

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end 
  end 

    # test suite for GET /users/:id
  describe 'GET /users/:id' do
    # make HTTP request
    before { get "/users/#{user_id}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user_id)
      end 

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end 

    context 'when the record does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end 
  end 

    # test suite for POST /users
  describe 'POST /users' do
    # valid payload 
    let(:valid_attributes) { { name: 'Jessica Day', username: 'JAD', password: 'ab56q5u8', age: '26', gender: 'female' } }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'creates a user' do 
        expect(json['name']).to eq('Jessica Day')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do 
      before {post '/users', params: { name: 'Nick Miller' } }

      it 'returns status code 422' do 
        expect(response).to have_http_status(422)
      end 

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Password can't be blank, Username can't be blank, Age can't be blank, Gender can't be blank/)
      end
    end
  end

  # test suite for PUT /users/:id
  describe 'PUT /users/:id' do
    let(:valid_attributes) { { name: 'Nick Miller' } }

    context 'when the record exists' do
      before { put "/users/#{user_id}", params: valid_attributes }

      it 'updates the record' do 
        expect(response.body).to be_empty 
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end 

  # test suite for DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end 
  end
end 
            