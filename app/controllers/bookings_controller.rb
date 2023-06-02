class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(booking_params)
    @booking.offer = @offer
    @booking.user = current_user
    # TODO: Shouldn't we change the `offer.status` to `false` here?
    if @booking.save!
      redirect_to offer_path(@offer)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @offer = @booking.offer
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: "Booking successfully destroyed."
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :payment_method)
  end
end
