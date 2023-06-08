# frozen_string_literal: true

class Atoms::InputImageComponent < ViewComponent::Base
    def initialize form:, label:, name:, required:
        @form = form
        @label = label
        @name = name
        @required = required
    end
end
