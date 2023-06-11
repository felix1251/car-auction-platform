# frozen_string_literal: true

class Atoms::BtnNextComponent < ViewComponent::Base
    def initialize link:, brand:, car_type:, year:, pagy:
        @link = link
        @brand = brand
        @car_type = car_type
        @year = year
        @pagy = pagy
    end
end
