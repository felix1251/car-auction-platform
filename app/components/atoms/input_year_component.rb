# frozen_string_literal: true

class Atoms::InputYearComponent < ViewComponent::Base
    def initialize form:, label:, name:, placeholder:, required:
        @form = form
        @label = label
        @name = name
        @required = required
        @placeholder = placeholder
    end
end
