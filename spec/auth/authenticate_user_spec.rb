require 'rails_helper'

RSpec.describe AuthenticateUser do 
  # create test user
  let(:user) { create(:user) }

  # valid request subject
  subject(:valid_auth_obj) { described_class.new(user.username, user.password) }

  # invalid request subject
  subject(:invalid_auth_obj) { described_class.new('j_day', 'password1') }

  # test suite from AuthenticateUser#call 
  describe '#call' do
    # return token when request is valid
    context 'when valid credentials' do 
      it 'returns an auth token' do 
        token = valid_auth_obj.call
        expect(token).not_to be_nil
      end 
    end 

    # raise Authentication Error when request is invalid
    context 'when invalid credentials' do 
      it 'raises an authentication error' do 
        expect { invalid_auth_obj.call }.to raise_error(ExceptionHandler::AuthenticationError, /Invalid credentials/)
      end 
    end
  end 
end
