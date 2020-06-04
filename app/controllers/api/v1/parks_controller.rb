class Api::V1::ParksController < ApplicationController
  before_action :set_park, only: [:show, :update, :destroy]

  # GET /parks
  def index 
    @parks = Park.all
    json_response(@parks)
  end 

  # POST /parks
  def create
    Park.create!(park_params)
    json_response(@park, :created)
  end 

  # GET /parks/:id
  def show
    json_response(@park)
  end 

  # PUT /parks/:id
  def update
    @park.update(park_params)
  end 

  private

  def park_params
    params.permit(:name, :location, :park_type)
  end 

  def set_park
    @park = Park.find(params[:id])
  end
end