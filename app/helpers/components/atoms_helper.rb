module Components
  module AtomsHelper
    def btn_component btn_type: "primary", label: "Click me!", extra_css: ""
      render Atoms::ButtonComponent.new btn_type: btn_type, label: label, extra_css: extra_css
    end

    def bid_card_component
      render Atoms::BidCardComponent.new
    end

    def input_text_component form:, label: nil, name: "", placeholder: nil
      render Atoms::InputTextComponent.new form: form, label: label, name: name, placeholder: placeholder
    end

    def input_number_component form:, label: nil, name: "", placeholder: nil
      render Atoms::InputNumberComponent.new form: form, label: label, name: name, placeholder: placeholder
    end

    def input_password_component form:, label: nil, name: "", placeholder: nil
      render Atoms::InputPasswordComponent.new form: form, label: label, name: name, placeholder: placeholder
    end

    def input_year_component form:, label: nil, name: ""
      render Atoms::InputYearComponent.new form: form, label: label, name: name
    end

    def input_date_component form:, label: nil, name: ""
      render Atoms::InputDateComponent.new form: form, label: label, name: name
    end
  end
end
