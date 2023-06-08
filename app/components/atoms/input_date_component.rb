# frozen_string_literal: true

class Atoms::InputDateComponent < ViewComponent::Base
    def initialize form:, label:, name:, required:
        @form = form
        @label = label
        @name = name
        @required = required
    end
end
