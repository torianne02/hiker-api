class V2::UsersController < ApplicationController
  def index
    json_response({ message: "Hola" })
  end
end
