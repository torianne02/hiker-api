class Api::V1::HikesController < ApplicationController
  before_action :set_park
  before_action :set_hike, only: [:show, :update, :destroy]

  # GET /parks/:park_id/hikes 
  def index 
    @hikes = Hike.all
    json_response(@park.hikes)
  end 

  # GET /parks/:park_id/hikes/:id
  def show 
    json_response(@hike)
  end 

  # POST /parks/:park_id/hikes
  def create
    @park.hikes.create!(hike_params)
    json_response(@park, :created)
  end 

  # PUT /parks/:park_id/hikes/:id
  def update
    @hike.update(hike_params)
    head :no_content
  end 

  # DELETE /parks/:park_id/hikes/:id 
  def destroy
    @hike.destroy
    head :no_content 
  end 

  private

  def hike_params
    params.permit(:name, :park_id)
  end 

  def set_hike 
    @hike = @park.hikes.find_by!(id: params[:id]) if @park
  end 

  def set_park
    @park = Park.find(params[:park_id])
  end
end