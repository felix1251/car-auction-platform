class Auction < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    validates :opening_price, presence: true
    validates :price_increment, presence: true
    validates :brand, presence: true
    validates :year, presence: true
    validates :expired_at, presence: true
end
