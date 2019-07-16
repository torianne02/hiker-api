require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  # create test user
  let(:user) { create(:user) }

  # mock authorization header
  let(:header) { { 'Authorization' => token_generator(user.id) } }

  # invalid request subject
  subject(:invalid_request_obj) { described_class.new({}) }

  # valid request subject
  subject(:request_obj) { described_class.new(header) }

  # test suite for AuthorizeApiRequest#call
  describe '#call' do
    #returns user obj when request is valid
    context 'when valid request' do
      it 'returns user object' do 
        result = request_obj.call
        expect(result[:user]).to eq(user)
      end
    end

    # returns error message when request is invalid
    context 'when invalid request' do
      context 'when missing token' do 
        it 'raises a MissingToken error' do
          expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::MissingToken, 'Missing token')
        end 
      end 

      context 'when invalid token' do
        subject(:invalid_request_obj) do 
          # custom helper method token_generator
          described_class.new('Authorization' => token_generator(5))
        end 

        it 'raises an InvalidToken error' do
          expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::InvalidToken, /Invalid token/)
        end 
      end

      context 'when token is expired' do
        let(:header) { { 'Authorization' => expired_token_generator(user.id) } }
        subject(:request_obj) { described_class.new(header) }

        it 'raises ExceptionHandler::ExpiredSignature error' do
          expect { request_obj.call }.to raise_error(ExceptionHandler::InvalidToken, /Signature has expired/)
        end 
      end 

      context 'fake token' do 
        let(:header) { { 'Authorization' => 'foobar' } }
        subject(:invalid_request_obj) { described_class.new(header) }

        it 'handles JWT::DecodeError' do 
          expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::InvalidToken, /Not enough or too many segments/)
        end 
      end 
    end 
  end 
end 