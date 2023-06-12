class AuctionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_auction, only: %i[ show bid destroy ]
  before_action :is_mine_or_admin, only: %i[ destroy ]
  before_action :set_owner_only, only: %i[ edit update ]
  before_action :is_bid_valid, only: %i[ bid ]

  # GET /auctions or /auctions.json
  # def index
  #   @auctions = Auction.all
  # end

  # GET /auctions/1 or /auctions/1.json
  def show
    bidders = @auction.auction_transactions
    bidders = bidders.select(:id, :fullname, :price_sold)
    bidders = bidders.joins(:user).order(id: :desc)

    @pagy, @bidders = pagy(bidders, items: 15)
  end

  # GET /auctions/new
  def new
    @auction = Auction.new
  end

  # GET /auctions/1/edit
  def edit
  end

  def bid
    ActiveRecord::Base.transaction do
      @auction.update(price_hold: @price_to_update, bid_count: @auction.bid_count + 1)
      current_user.auction_transactions.create!(auction_id: @auction.id, price_sold: @price_to_update )
      respond_to do |format|
        format.turbo_stream { render "bid_notif", locals: { msg: "You successfully bid an auction", error: false } }
      end
    end
  rescue ActiveRecord::RecordInvalid => exception
    respond_to do |format|
      format.turbo_stream { render "bid_notif", locals: { msg: "Can't process bid, somethig is wrong", error: true } }
    end
  end

  # POST /auctions or /auctions.json
  def create
    @auction = current_user.auctions.new(auction_params)

    respond_to do |format|
      if @auction.save
        format.html { redirect_to auction_url(@auction), notice: "Auction was successfully created." }
        format.json { render :show, status: :created, location: @auction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auctions/1 or /auctions/1.json
  def update
    respond_to do |format|
      if @auction.update(auction_params)
        format.html { redirect_to auction_url(@auction), notice: "Auction was successfully updated." }
        format.json { render :show, status: :ok, location: @auction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auctions/1 or /auctions/1.json
  def destroy
    @auction.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Auction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    def set_owner_only
      @auction = current_user.auctions.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auction_params
      params.require(:auction).permit(:brand, :year, :opening_price, :price_increment, :expired_at, :image, :car_type)
    end

    def bid_params
      params.require(:auction).permit(:bid_amount)
    end

    def is_mine_or_admin
      unless current_user.id == @auction.user_id || current_user.role == "admin"
        respond_to do |format|
          format.turbo_stream { render "bid_notif",
            locals: { msg: "You are not authorized to delete and auction", error: true },
            status: :bad_request
          }
        end
      end
    end

    def is_bid_valid
      @price_to_update = params[:bid_amount].to_i || 0

      unless @auction.user_id != current_user.id &&
            (@auction.expired_at >= Time.now || @auction.bid_count == 0) &&
            @price_to_update >= @auction.opening_price &&
            @price_to_update >= @auction.price_hold

        respond_to do |format|
          if @auction.auction_transactions.where(price_sold: @price_to_update).any?
            format.turbo_stream { render "bid_notif",
              locals: { msg: "Sorry, somebody has bid quicker with this price. Please check the new price.", error: true },
              status: :bad_request
            }
          else
            format.turbo_stream { render "bid_notif",
              locals: { msg: "Bid Invalid, try to refresh page", error: true },
              status: :bad_request
            }
          end
        end
      end
    end
end
