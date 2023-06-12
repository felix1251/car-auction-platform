# frozen_string_literal: true

class Atoms::BidCardComponent < ViewComponent::Base
    delegate :current_user, :price_display_component,
    :bid_btn_component, :bid_count_component, to: :helpers

    def initialize data:
        @data = data
    end

    def hold_amount
        Auction.hold_cal(@data)
    end

    def sold_amount
        Auction.sold_cal(@data)
    end

    def owned_by_current_user
        @data.user_id == current_user.id
    end

    def is_user_admin
        current_user.role == "admin"
    end

    def is_expired
        @data.expired_at <= Time.now && @data.bid_count > 0
    end
end
