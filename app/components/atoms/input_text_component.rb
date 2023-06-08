# frozen_string_literal: true

class Atoms::InputTextComponent < ViewComponent::Base
    def initialize form:, label:, name:, placeholder:, required:
        @form = form
        @label = label
        @name = name
        @placeholder = placeholder
        @required = required
    end
end
