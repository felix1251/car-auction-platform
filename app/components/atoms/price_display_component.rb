# frozen_string_literal: true

class Atoms::PriceDisplayComponent < ViewComponent::Base
  def initialize(id:, amount:, price_type:)
    @id = id
    @amount = amount
    @price_type = price_type
  end
end
