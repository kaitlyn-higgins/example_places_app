class Api::PlacesController < ApplicationController

  def index
    @places = Place.all
    render 'index.json.jbuilder'
  end

  def show
    @place = Place.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @place = Place.new(
      name: params[:name],
      address: params[:address]
      )
    if @place.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @place.errors.full_messages}
    end
  end

  def update
    @place = Place.find(params[:id])
    @place.name = params[:name] || @place.name
    @place.address = params[:address] || @place.address

    if @place.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @place.errors.full_messages}
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    render json: {message: "Place successfully destroyed!"}
  end

end
