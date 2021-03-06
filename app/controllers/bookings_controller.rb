class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :destroy]

  def index
    # @hostels = Hostel.all
    @bookings = Booking.where(user: current_user)
  end

  def show
     @booking = current_user.bookings.where(state: 'paid').find(params[:id])
  end


  def new
    @booking = Booking.new
  end



  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def create
    hostel = Hostel.find(params[:hostel_id].to_i)
    booking = Booking.new(hostel_sku: hostel.sku, amount: hostel.price, state: 'pending', user: current_user)
    booking.hostel = hostel
    booking.save
    redirect_to new_hostel_booking_payment_path(hostel, booking)
    # @booking = Booking.new(booking_params)
    # @hostel = Hostel.find(params[:hostel_id])
    # @booking.user = current_user
    # @booking.hostel = @hostel
    # if @booking.save
    #   redirect_to booking_path(@booking), notice: "Thanks for booking"
    # else
    #   render :new
    # end
  end

  def destroy
    @user = @booking.user
    @booking.destroy
    redirect_to booking_path(@user)
  end


private

def find_booking
  @booking = Booking.find(params[:id])
end


def booking_params
  params.require(:booking).permit(:date)
end


end
