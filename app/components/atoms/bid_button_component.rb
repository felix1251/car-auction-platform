# frozen_string_literal: true

class Atoms::BidButtonComponent < ViewComponent::Base
  def initialize(id:, hold_amount:)
    @id = id
    @hold_amount = hold_amount
  end

  def to_path
    bid_path(id: @id)
  end

  def path_id
    "bid_btn_#{@id}"
  end
end
