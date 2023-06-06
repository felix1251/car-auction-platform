module Components
  module OrganismsHelper
      def header_component
        render Organisms::HeaderComponent.new
      end

      def sticky_header_filter_component
        render Organisms::StickyHeaderFilterComponent.new
      end
  end
end
