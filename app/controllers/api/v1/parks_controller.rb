class Api::V1::ParksController < ApplicationController
  before_action :set_park, only: [:show, :update, :destroy]

  # GET /parks/:park_id/hikes 
  def index 
    @parks = Park.all
    json_response(@parks)
  end 

  # POST /parks/:park_id/hikes
  def create
    Park.create!(park_params)
    json_response(@park, :created)
  end 

  private

  def park_params
    params.permit(:name, :location, :park_type)
  end 

  def set_park
    @park = Park.find(params[:id])
  end
end