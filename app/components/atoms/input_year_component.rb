# frozen_string_literal: true

class Atoms::InputYearComponent < ViewComponent::Base
    def initialize form:, label:, name:
        @form = form
        @label = label
        @name = name
    end
end
