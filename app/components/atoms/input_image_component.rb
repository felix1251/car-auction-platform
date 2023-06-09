# frozen_string_literal: true

class Atoms::InputImageComponent < ViewComponent::Base
    def initialize form:, label:, name:, required:, data:
        @form = form
        @label = label
        @name = name
        @required = required
        @data = data
    end

    def is_image_attached
        @data&.image&.attached?
    end
end
