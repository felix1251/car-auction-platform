module Components
  module AtomsHelper
    def btn_component btn_type: "primary", label: "Click me!", extra_css: ""
      render Atoms::ButtonComponent.new btn_type: btn_type, label: label, extra_css: extra_css
    end

    def bid_card_component data: []
      render Atoms::BidCardComponent.new data: data
    end

    def price_display_component amount:, id:, price_type:
      render Atoms::PriceDisplayComponent.new amount: amount, id: id, price_type: price_type
    end

    def bid_btn_component id:, hold_amount:
      render Atoms::BidButtonComponent.new id: id, hold_amount: hold_amount
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

    def input_image_component form:, label: nil, name: "", required: false, data: nil
      render Atoms::InputImageComponent.new form: form, label: label, name: name, required: required, data: data
    end

    def notification_component notif_type: "info", msg: "message"
      render Atoms::NotificationComponent.new notif_type: notif_type, msg: msg
    end
  end
end
