class HostelsController < ApplicationController

  def index
    # location
    if params[:query].present?
      @hostels = Hostel.search_address(params[:query]).where.not(latitude: nil, longitude: nil)
    else
      @hostels = Hostel.where.not(latitude: nil, longitude: nil)
    end

    # female_only
    if params[:female_only].present?
      @hostels = @hostels.where(female_only: params[:female_only])
    end

    # pets
    if params[:pets].present?
      @hostels = @hostels.where(pets: params[:pets])
    end

    # alcohol
    if params[:alcohol].present?
      @hostels = @hostels.where(alcohol: params[:alcohol])
    end

    # if params[:query].present?
    #    @hostels = Hostel.search_room_type(params[:query]).where.not(female: false)
    # else
    #   @hostels = Hostel.where.not(female: false)

    # end

    @icon_url = ActionController::Base.helpers.image_url('orangepin.png')
    @user_icon = ActionController::Base.helpers.image_url('user-icon.png')

     @markers = @hostels.map do |hostel|
      {
        lat: hostel.latitude,
        lng: hostel.longitude,
        icon: { url: @icon_url}

       }
    end

    if headers['Content-Type'] == 'application/javascript'
      render partial: 'hostels/index'
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    # @booking = Booking.create(user_id: current_user)
    @hostel = Hostel.find(params[:id])
    @booking = Booking.create(hostel_sku: @hostel.sku, amount: @hostel.price, state: 'pending', user: current_user, hostel: @hostel)
  end
end
