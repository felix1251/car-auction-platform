class AuctionTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :auction

  validates :price_sold, presence: true
end
