class HostelsController < ApplicationController

  def index
    # @hostels = Hostel.all
    if params[:query].present?
      @hostels = Hostel.search_address(params[:query]).where.not(latitude: nil, longitude: nil)
    else
      @hostels = Hostel.where.not(latitude: nil, longitude: nil)
    end

    #  if params[:query].present?
    #   @hostels = Hostel.search_address(params[:query])
    # else
    #   @hostels = Hostel.all
    # end

    # @hostels = Hostel.where.not(latitude: nil, longitude: nil)

     @markers = @hostels.map do |hostel|
      {
        lat: hostel.latitude,
        lng: hostel.longitude,
        icon: { url: ActionController::Base.helpers.image_url('orangepin.png')}

       }
    end
  end

  def show
    # @booking = Booking.create(user_id: current_user)
    @hostel = Hostel.find(params[:id])
  end
end
