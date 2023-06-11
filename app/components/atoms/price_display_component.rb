# frozen_string_literal: true

class Atoms::PriceDisplayComponent < ViewComponent::Base
  def initialize(id:, amount:, price_type:, size:)
    @id = id
    @amount = amount
    @price_type = price_type
    @size = size
  end

  def sizecss
    case @size
    when "sm"
      "text-sm"
    when "md"
      "text-md"
    when "lg"
      "text-md"
    when "xl"
      "text-xl"
    else
      "md"
    end
  end
end
