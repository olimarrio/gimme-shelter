class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :destroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def new
    @booking = Booking.find(params[:user_id])
    @booking = Booking.new
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def create
    @user = current_user
    @booking = Booking.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    if @booking.save
      redirect_to booking_path(@booking), notice: "Thanks for booking"
    else
      render :new
    end
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
