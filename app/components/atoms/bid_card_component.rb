# frozen_string_literal: true

class Atoms::BidCardComponent < ViewComponent::Base
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
end
