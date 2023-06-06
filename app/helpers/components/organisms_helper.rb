module Components
  module OrganismsHelper
      def header_component
        render Organisms::HeaderComponent.new
      end
  end
end
