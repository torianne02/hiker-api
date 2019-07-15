class HikesController < ApplicationController
  before_action :set_user
  before_action :set_hike, only: [:show, :update, :destroy]

  # GET /users/:user_id/hikes 
  def index 
    json_response(@user.hikes)
  end 

  # GET /users/:user_id/hikes/:id
  def show 
    json_response(@hike)
  end 

  # POST /users/:user_id/hikes
  def create
    @user.hikes.create!(hike_params)
    json_response(@user, :created)
  end 

  # PUT /users/:user_id/hikes/:id
  def update
    @hike.update(hike_params)
    head :no_content
  end 

  # DELETE /users/:user_id/hikes/:id 
  def destroy
    @hike.destroy
    head :no_content 
  end 

  private

  def hike_params
    params.permit(:name, :location, :distance, :date_completed, :elevation_gain)
  end 

  def set_user 
    @user = User.find(params[:user_id])
  end 

  def set_hike 
    @hike = @user.hikes.find_by!(id: params[:id]) if @user
  end 
end
