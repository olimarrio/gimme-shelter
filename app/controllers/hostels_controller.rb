class HostelsController < ApplicationController

  def index
    # @hostels = Hostel.all
    # if params[:query].present?
    #   @hostels = Hostel.search_address(params[:query]).where.not(latitude: nil, longitude: nil)
    # else
    #   @hostels = Hostel.where.not(latitude: nil, longitude: nil)
    # end
     if params[:query].present?
      @hostels = Hostel.search_address(params[:query])
    else
      @hostels = Hostel.all
    end
  end

  def show
    @hostel = Hostel.find(params[:id])
  end
end
