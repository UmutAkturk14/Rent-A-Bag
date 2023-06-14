class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many_attached :photos
  validates :title, :brand, :price, presence: true

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  include PgSearch::Model

  pg_search_scope :search_offers,
                  against: [:brand, :title, :city],
                  using: {
                    tsearch: { prefix: true }
                  }
end
