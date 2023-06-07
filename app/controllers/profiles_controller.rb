class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def my_page
    @user = current_user
    @bookings = Booking.where(user: @user)
  end
end
