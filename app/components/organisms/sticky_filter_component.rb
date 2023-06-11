# frozen_string_literal: true

class Organisms::StickyFilterComponent < ViewComponent::Base
    delegate :btn_component, :input_text_component, to: :helpers

    def initialize count:
        @count = count
    end
end
