class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_respond_type

  def index
    auctions = Auction.order(id: :asc)
    auctions = auctions.with_brand(params[:brand]) if params[:brand].present?
    auctions = auctions.with_type(params[:car_type]) if params[:car_type].present?
    auctions = auctions.with_year(params[:year]) if params[:year].present?

    @pagy, @auctions = pagy(auctions, items: params[:per_page])

    respond_to do |format|
      format.html
      format.turbo_stream { render template: "auctions/paginate" }
    end
  end

  def set_respond_type
    request.format = :turbo_stream if params[:stream].present?
  end
end
