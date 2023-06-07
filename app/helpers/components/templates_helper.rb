module Components
  module TemplatesHelper
    def primary_layout_component router_view:
      render Templates::PrimaryLayoutComponent.new router_view: router_view
    end
  end
end
