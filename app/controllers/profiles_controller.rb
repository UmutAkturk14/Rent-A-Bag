class ProfilesController < ApplicationController
  before_action :set_user, only: [:update]

  def show
    @user = User.find(params[:id])
  end

  def my_page
    @user = current_user
    @user_offers = current_user.offers
  end

  def edit

  end

  def update
    @user.update(user_params)
    redirect_to my_profile_path, notice: "User has been successfully updated"
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :bio, :phone_number, :city)
  end
end
