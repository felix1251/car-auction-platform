# frozen_string_literal: true

class Atoms::ButtonComponent < ViewComponent::Base
    def initialize(btn_type:, label:, extra_css:, html_type:)
        @btn_type = btn_type
        @label = label
        @extra_css = extra_css
        @html_type = html_type
    end

    def twcss
        case @btn_type
        when "primary"
            "btn-primary"
        when "ghost"
            "btn-ghost"
        else
            "btn-primary"
        end
    end
end
