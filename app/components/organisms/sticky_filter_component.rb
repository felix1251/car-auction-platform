# frozen_string_literal: true

class Organisms::StickyFilterComponent < ViewComponent::Base
  delegate :btn_component, to: :helpers

  def initialize
  end
end
