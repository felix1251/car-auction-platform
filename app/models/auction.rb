class Auction < ApplicationRecord
    include Devise
    belongs_to :user
    has_one_attached :image
    has_many :auction_transactions

    validates :opening_price, presence: true
    validates :price_increment, presence: true
    validates :brand, presence: true
    validates :year, presence: true
    validates :expired_at, presence: true
    after_update_commit :brodcast_auction_card

    def self.sold_cal auction
        if auction.price_hold > 0
            auction.price_hold
        else
            auction.opening_price
       end
    end

    def self.hold_cal auction
        if auction.price_hold > 0
            auction.price_hold + auction.price_increment
        else
            auction.opening_price + auction.price_increment
        end
    end

    private

    def brodcast_auction_card
        Turbo::StreamsChannel.broadcast_render_to(
            "bid_cards",
            template: "auctions/bidcard",
            locals: { hold_amount: Auction.hold_cal(self), sold_amount: Auction.sold_cal(self), id: self.id }
        )
    end
end
