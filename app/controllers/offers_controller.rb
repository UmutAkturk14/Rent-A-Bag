class OffersController < ApplicationController
  def index
    if params[:query].present?
      @offers = Offer.search_offers(params[:query])
    else
      @offers = Offer.all
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
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

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      redirect_to offers_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :brand, :condition, :price, :city, :status, photos:[])
  end

end
