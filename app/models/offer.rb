class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many_attached :photos
  validates :title, :brand, :price, presence: true

  include PgSearch::Model

  pg_search_scope :search_offers,
                  against: [:brand, :title, :city],
                  using: {
                    tsearch: { prefix: true }
                  }
end
