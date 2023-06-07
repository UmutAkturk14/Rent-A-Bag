class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def my_page
    @user = current_user
    @bookings = Booking.where(user: @user)
  end

  def edit

  end

  def update
    puts "Welcome to the update page"
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :bio, :phone_number, :city)
  end
end
