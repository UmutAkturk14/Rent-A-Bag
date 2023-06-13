class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    offers = Offer.all
    @homepage_items = []
    4.times do |_|
      sampled_item = offers.sample
      @homepage_items << sampled_item
    end
  end

  def about
  end
end
