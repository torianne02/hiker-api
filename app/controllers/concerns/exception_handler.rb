module ExceptionHandler
  extend ActiveSupport::Concern

  # define custom error subclasses
  class AuthenticationError < StandardError; end 
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end 

  included do 
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
      end

    rescue_from ActiveRecord::RecordInvalid do |e|
        json_response({ message: e.message }, :unprocessable_entity)
    end 
  end 
end 
