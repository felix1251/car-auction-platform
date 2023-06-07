module Components
    module AtomsHelper
        def btn_component(btn_type: "primary", label: "Click me!", extra_css: "")
          render Atoms::ButtonComponent.new(btn_type: btn_type, label: label, extra_css: extra_css)
        end
    end
  end
