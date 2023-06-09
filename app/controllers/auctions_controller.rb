class AuctionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_auction, only: %i[ show edit update destroy bid ]
  before_action :check_transaction, only: %i[ bid ]

  # GET /auctions or /auctions.json
  def index
    @auctions = Auction.all
  end

  # GET /auctions/1 or /auctions/1.json
  def show
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
      @auction.update(price_hold: @price_to_update)
      current_user.auction_transactions.create!(auction_id: @auction.id, price_sold: @price_to_update )
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("notification", partial: "auctions/success_notification"), locals: { auction: @auction }}
      end
    end
  rescue ActiveRecord::RecordInvalid => exception
    puts "------------------:", exception
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("notification",
        partial: "auctions/error_notification", locals: { error: "The bid price is already owned by someone or Invalid"}),
        locals: { error: exception }
      }
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
      format.html { redirect_to auctions_url, notice: "Auction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    def check_transaction
      @price_to_update = params[:bid_amount].to_i || 0
      unless @price_to_update >= @auction.opening_price && @price_to_update >= @auction.price_hold && !@auction.auction_transactions.where(price_sold: @price_to_update).any?
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace("notification",
            partial: "auctions/error_notification", locals: { error: "The bid price is already owned by someone or Invalid"}),
            status: :unprocessable_entity
          }
        end
      end
    end

    # Only allow a list of trusted parameters through.
    def auction_params
      params.require(:auction).permit(:brand, :year, :opening_price, :price_increment, :expired_at, :image)
    end

    def bid_params
      params.require(:auction).permit(:bid_amount)
    end
end
