module Components
  module OrganismsHelper
    def header_component
      render Organisms::HeaderComponent.new
    end

    def sticky_filter_component
      render Organisms::StickyFilterComponent.new
    end
  end
end
