# frozen_string_literal: true

class Templates::PrimaryLayoutComponent < ViewComponent::Base
  delegate :header_component, :sticky_header_filter_component, to: :helpers

  def initialize(router_view:)
    @router_view = router_view
  end

  def router_view
    @router_view
  end
end
