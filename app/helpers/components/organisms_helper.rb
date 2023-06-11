module Components
  module OrganismsHelper
    def header_component
      render Organisms::HeaderComponent.new
    end

    def sticky_filter_component count:
      render Organisms::StickyFilterComponent.new count: count
    end
  end
end
