# frozen_string_literal: true

class Atoms::BidCardComponent < ViewComponent::Base
    delegate :current_user, to: :helpers

    def initialize data:
        @data = data
    end

    def bid_amount
        if @data.price_hold > 0
            @data.price_hold + @data.price_increment
        else
            @data.opening_price + @data.price_increment
        end
    end

    def owned_by_current_user
        @data.user_id == current_user.id
    end
end
