class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def new
    @offers = Offer.new
  end

  def create
    @offers = Offer.new(offer_params)
    @offers.user = current_user
    if @offers.save!
      redirect_to offers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :brand, :condition, :price, :city, :status)
  end

end
