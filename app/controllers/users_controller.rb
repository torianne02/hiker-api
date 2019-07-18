class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end 

  # POST /users
  def create
    @user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.username, user.password)
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
    params.permit(:name, :username, :password, :age, :gender, :password_confirmation)
  end 

  def set_user
    @user = User.find(params[:id])
  end 
end
