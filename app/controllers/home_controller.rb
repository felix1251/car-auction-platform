class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @auctions = pagy(Auction.order(id: :asc), items: params[:per_page])
  end
end
