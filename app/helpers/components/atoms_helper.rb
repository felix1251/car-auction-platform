module Components
  module AtomsHelper
    def btn_component btn_type: "primary", label: "Click me!", extra_css: ""
      render Atoms::ButtonComponent.new btn_type: btn_type, label: label, extra_css: extra_css
    end

    def bid_card_component
      render Atoms::BidCardComponent.new
    end

    def input_text_component form:, label: nil, name: "", placeholder: nil, required: false
      render Atoms::InputTextComponent.new form: form, label: label, name: name, placeholder: placeholder, required: required
    end

    def input_number_component form:, label: nil, name: "", placeholder: nil, required: false
      render Atoms::InputNumberComponent.new form: form, label: label, name: name, placeholder: placeholder, required: required
    end

    def input_password_component form:, label: nil, name: "", placeholder: nil
      render Atoms::InputPasswordComponent.new form: form, label: label, name: name, placeholder: placeholder
    end

    def input_year_component form:, label: nil, name: "", placeholder: nil, required: false
      render Atoms::InputYearComponent.new form: form, label: label, name: name, required: required, placeholder: placeholder
    end

    def input_date_component form:, label: nil, name: "", required: false
      render Atoms::InputDateComponent.new form: form, label: label, name: name, required: required
    end
  end
end
