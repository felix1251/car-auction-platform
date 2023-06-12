# frozen_string_literal: true

class Atoms::NotificationComponent < ViewComponent::Base
  def initialize(notif_type:, msg:)
    @notif_type = notif_type
    @msg = msg
  end

  def twcss
    case @notif_type
    when "success"
      "border-green-500 text-green-500"
    when "error"
      "border-red-500 text-red-500"
    when "warning"
      "border-yellow-500 text-yellow-500"
    when "info"
      "border-blue-500 text-blue-500"
    else
      "border-blue-500 text-blue-500"
    end
  end

  def iconcss
    case @notif_type
    when "success"
      "text-green-500"
    when "error"
      "text-red-500"
    when "warning"
      "text-yellow-500"
    when "info"
      "text-blue-500"
    else
      "text-blue-500"
    end
  end

  def icon_type
    case @notif_type
    when "success"
      "check"
    when "error"
      "warning"
    when "warning"
      "warning"
    when "info"
      "info"
    else
      "info"
    end
  end
end
