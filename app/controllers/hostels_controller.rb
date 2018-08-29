class HostelsController < ApplicationController

  def index
    @hostels = Hostel.all
  end

  def show
    # @booking = Booking.create(user_id: current_user)
    @hostel = Hostel.find(params[:id])
  end
end
