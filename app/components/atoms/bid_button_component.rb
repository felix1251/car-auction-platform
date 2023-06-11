# frozen_string_literal: true

class Atoms::BidButtonComponent < ViewComponent::Base
  def initialize(id:, hold_amount:, floating:, size:, extra_css:)
    @id = id
    @hold_amount = hold_amount
    @floating = floating
    @size = size
    @extra_css = extra_css
  end

  def to_path
    bid_path(id: @id)
  end

  def path_id
    "bid_btn_#{@id}"
  end

  def is_floating
    @floating
  end

  def sizecss
    case @size
    when "sm"
      "px-3 py-1.5"
    when "md"
      "px-4 py-2"
    when "lg"
      "px-5 py-2"
    else
      "px-3 py-1.5"
    end
  end

  def iconcss
    case @size
    when "sm"
      "text-2xl"
    when "md"
      "text-2.5xl"
    when "lg"
      "text-3xl"
    else
      "text-2xl"
    end
  end

  def textcss
    case @size
    when "sm"
      "text-md"
    when "md"
      "text-md"
    when "lg"
      "text-lg"
    else
      "text-md"
    end
  end
end
