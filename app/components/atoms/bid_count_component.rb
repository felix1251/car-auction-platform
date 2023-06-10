# frozen_string_literal: true

class Atoms::BidCountComponent < ViewComponent::Base
  def initialize(count:, id:)
    @id = id
    @count = count
  end
end
