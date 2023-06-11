class AuctionTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :auction
  validates :price_sold, presence: true
  after_create_commit :brodcast_auction_page

  private

  def brodcast_auction_page
    curr_auction = auction
    Turbo::StreamsChannel.broadcast_render_to(
        "auction_#{self.auction_id}",
        template: "auctions/auction",
        locals: {
            id: self.auction_id,
            hold_amount: Auction.hold_cal(curr_auction),
            sold_amount: Auction.sold_cal(curr_auction),
            bid_count: curr_auction.bid_count,
            fullname: user.fullname || "********"
        }
    )
  end
end
