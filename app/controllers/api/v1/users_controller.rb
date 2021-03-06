class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authorize_request, only: :create

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end 

  # POST /users
  def create
    @user = User.create!(user_params)
    
    auth_token = AuthenticateUser.new(@user.username, @user.password)
    
    response = { message: Message.account_created, auth_token: auth_token}
    
    json_response(response, :created)
  end 

  # GET /users/:id
  def show
    json_response(@user)
  end 

  # PUT /users/:id
  def update
    @user.update(user_params)
  end 

  # DELETE /users/:id 
  def destroy
    @user.destroy
  end

  private 

  def user_params
    params.permit(:name, :username, :email, :password, :birthday, :gender)
  end 

  def set_user
    @user = User.find(params[:id])
  end 

  # def total_distance_hiked
  #   @total_distance = @user.hikes.sum { |hike| hike.distance }
  # end 
end