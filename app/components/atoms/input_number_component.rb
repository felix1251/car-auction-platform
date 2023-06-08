# frozen_string_literal: true

class Atoms::InputNumberComponent < ViewComponent::Base
    def initialize form:, label:, name:, placeholder:
        @form = form
        @label = label
        @name = name
        @placeholder = placeholder
    end
end
